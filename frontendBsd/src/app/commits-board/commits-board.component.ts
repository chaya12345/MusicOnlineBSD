import { group } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { element } from 'protractor';
import { Commit } from '../classes/commit';
import { CommitsToArticles } from '../classes/commitsToArticles';
import { CommitDetailsComponent } from '../commit-details/commit-details.component';
import { MessageComponent } from '../message/message.component';
import { CommitService } from '../services/commit.service';
import { CommitsToArticlesService } from '../services/commits-to-articles.service';
import { CommitsToSongsService } from '../services/commits-to-songs.service';
import { CommonMessageService } from '../services/common-message.service';

export class Group {
  name: string;
  list: Commit[];
}

@Component({
  selector: 'commits-board',
  templateUrl: './commits-board.component.html',
  styleUrls: ['./commits-board.component.css']
})
export class CommitsBoardComponent implements OnInit {

  commitsNotChecked: Commit[] = [];
  commitsChecked: Commit[] = [];
  commits: Commit[] = [];
  groupsNotChecked: Group[] = [];
  groupsChecked: Group[] = [];
  selectedCommit: Commit;

  constructor(private commitService: CommitService, private commitsToArticlesService: CommitsToArticlesService,
    private commitsToSongsService: CommitsToSongsService, private cmService: CommonMessageService,
    private _snackBar: MatSnackBar, public dialog: MatDialog) {
    this.getCommits();
    let today = new Group();
    today.name = "היום";
    today.list = [];
    this.groupsNotChecked.push(today);
  }

  ngOnInit(): void {
  }

  getCommits(): void {
    try {
      this.commitService.getCommits()
        .subscribe(commits => {
          this.commits = commits;
          this.commits.forEach(commit => {
            commit.tested == true ?
              this.commitsChecked.push(commit) :
              this.commitsNotChecked.push(commit);
          });
          this.commits.sort((a, b) => Math
            .round(new Date(b.date).getTime() - new Date(a.date).getTime()));
          this.groupingListByDate(this.commitsChecked,this.groupsChecked);
          this.groupingListByDate(this.commitsNotChecked,this.groupsNotChecked);
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }
  groupingCommitByDate(commit: Commit,groupList:Group[]): void {
    let date = new Date(commit.date);
    let today = new Date();
    date.setHours(0, 0, 0, 0);
    today.setHours(0, 0, 0, 0);
    if (this.calculateDiff(date) == 0) { //new Date(date) == today
      this.addItemToGroup("היום", commit,groupList);
    }
    else if (this.calculateDiff(date) == 1) { //new Date(date) == new Date(today.setDate(today.getDate() - 1))
      this.addItemToGroup("אתמול", commit,groupList);
    }
    else if (this.isInCurrentWeek(date)) {
      this.addItemToGroup("השבוע", commit,groupList);
    }
    else if (this.isInAnOneWeekAgo(date)) {
      this.addItemToGroup("שבוע שעבר", commit,groupList);
    }
    else if (this.isInCurrentMonth(date)) {
      this.addItemToGroup("מוקדם יותר החודש", commit,groupList); //19
    }
    else if (new Date(date).getFullYear() == today.getFullYear()) {
      this.addItemToGroup("מוקדם יותר השנה", commit,groupList);
    }
    else {
      this.addItemToGroup("לפני זמן רב", commit,groupList);
    }
  }

  groupingListByDate(list: Commit[],groupList:Group[]): void {
    list.forEach(commit => {
      this.groupingCommitByDate(commit,groupList);
    });
  }

  addItemToGroup(name: string, item: Commit,groupList:Group[]): void {
    let exist: boolean = false;
    if (item.tested == false) {
      groupList.forEach(group => {
        if (group.name == name) {
          group.list.push(item);
          exist = true;
        }
      });
      if (exist == false) {
        let g = new Group();
        g.name = name;
        g.list = [];
        g.list.push(item);
        groupList.push(g);
      }
    }
    else {
      this.groupsChecked.forEach(group => {
        if (group.name == name) {
          group.list.push(item);
          exist = true;
        }
      });
      if (exist == false) {
        let g = new Group();
        g.name = name;
        g.list = [];
        g.list.push(item);
        this.groupsChecked.push(g);
      }
    }
  }

  calculateDiff(dateSent) {
    let currentDate = new Date();
    dateSent = new Date(dateSent);

    return Math.floor((Date.UTC(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate())
      - Date.UTC(dateSent.getFullYear(), dateSent.getMonth(), dateSent.getDate())) / (1000 * 60 * 60 * 24));
  }

  isInCurrentWeek(date: Date): boolean {
    var curr = new Date;
    var first = curr.getDate() - curr.getDay();
    var last = first + 6;
    var firstday = new Date(curr.setDate(first)).toUTCString();
    firstday = new Date(new Date(firstday).setHours(0, 0, 0, 0)).toUTCString();
    var lastday = new Date(curr.setDate(last)).toUTCString();
    if (Date.parse(firstday) <= Date.parse(new Date(date).toUTCString()) &&
      Date.parse(new Date(date).toUTCString()) < Date.parse(lastday)) {
      return true;
    }
    return false;
  }

  isInAnOneWeekAgo(date: Date): boolean {
    var curr = new Date;
    var first = curr.getDate() - curr.getDay() - 7;
    var last = first - 1;
    var firstday = new Date(curr.setDate(first)).toUTCString();
    var lastday = new Date(curr.setDate(last)).toUTCString();
    if (Date.parse(firstday) < Date.parse(new Date(date).toUTCString()) &&
      Date.parse(new Date(date).toUTCString()) < Date.parse(lastday)) {
      return true;
    }
    return false;
  }

  isInCurrentMonth(date: Date): boolean {
    var currDate = new Date();
    var firstDay = new Date(currDate.getFullYear(), currDate.getMonth(), 1);
    var lastDay = new Date(currDate.getFullYear(), currDate.getMonth() + 1, 0);
    if (Date.parse(new Date(firstDay).toUTCString()) < Date.parse(new Date(date).toUTCString()) &&
      Date.parse(new Date(date).toUTCString()) < Date.parse(new Date(lastDay).toUTCString())) {
      return true;
    }
    return false;
  }

  signAsTested(commit: Commit): void {
    if (!commit.tested) {
      this.changeSigning(commit, true);
      this.groupsNotChecked.forEach(group => {
        group.list.forEach(element => {
          if (element.id == commit.id)
            group.list.splice(group.list.indexOf(element), 1);
        });
      });
      this.groupingCommitByDate(commit,this.groupsChecked);
    }
  }

  removeSigning(commit: Commit): void {
    this.changeSigning(commit, false);
  }

  changeSigning(commit: Commit, isSign: boolean): void {
    if (commit.type == "article") {
      try {
        this.commitsToArticlesService.updateIsTested(commit.id, isSign).subscribe(result => {
          if (result == true) {
            this.openSnackBar(this.cmService.COMMIT_SIGNING.SUCCESS);
            this.signCommit(commit);
          }
          else this.openSnackBar(this.cmService.COMMIT_SIGNING.FAIL);
        }, err => this.openSnackBar(this.cmService.COMMIT_SIGNING.ERROR));
      } catch (err) { console.log(err); }
    }
    else if (commit.type == "song") {
      try {
        this.commitsToSongsService.updateIsTested(commit.id, isSign).subscribe(result => {
          if (result == true) {
            this.openSnackBar(this.cmService.COMMIT_SIGNING.SUCCESS);
            this.signCommit(commit);
          }
          else this.openSnackBar(this.cmService.COMMIT_SIGNING.FAIL);
        }, err => this.openSnackBar(this.cmService.COMMIT_SIGNING.ERROR));
      } catch (err) { console.log(err); }
    }
  }

  deleteCommit(commit: Commit): void {
    if (commit.type == "article") {
      try {
        this.commitsToArticlesService.deleteCommit(commit.id).subscribe(result => {
          if (result == true) {
            this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS);
            this.deletingCommit(commit);
          }
          else this.openSnackBar(this.cmService.DELETE_ITEM.FAIL);
        }, err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
      } catch (err) { console.log(err); }
    }
    else if (commit.type == "song") {
      try {
        this.commitsToSongsService.deleteCommit(commit.id).subscribe(result => {
          if (result == true) {
            this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS);
            this.deletingCommit(commit);
          }
          else this.openSnackBar(this.cmService.DELETE_ITEM.FAIL);
        }, err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
      } catch (err) { console.log(err); }
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  deletingCommit(commit: Commit) {
    this.groupsNotChecked.forEach(element => {
      if (element.list.includes(commit, 0)) {
        let index = element.list.indexOf(commit);
        element.list.splice(index, 1);
      }
    });
    this.groupsChecked.forEach(element => {
      if (element.list.includes(commit, 0)) {
        let index = element.list.indexOf(commit);
        element.list.splice(index, 1);
      }
    });
  }

  signCommit(commit: Commit) {
    this.commitService.getCommitById(commit.id, commit.type).subscribe(updateCommit =>
      this.groupsNotChecked.forEach(element => {
        if (element.list.includes(commit, 0))
          element.list[element.list.indexOf(commit)] = updateCommit;
      }));
  }
  openMessageDialog(text: string, commit: Commit) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.deleteCommit(commit);
      });
    } catch (err) { console.log(err); }
  }
  openReportDetailsDialog(commit: Commit): void {
    try {
      const dialogRef = this.dialog.open(CommitDetailsComponent, {
        width: '350px',
        data: { commit: commit }
      });

      dialogRef.componentInstance.data.commit = commit;
      dialogRef.afterClosed().subscribe(result => {
        if (result == true) {
          this.changeSigning(commit, true);
        }
        else if (result == false) {
          this.changeSigning(commit, false);
        }
      });
    }
    catch (err) { console.log(err); }
  }

}
