import { group } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Commit } from '../classes/commit';
import { CommitsToArticles } from '../classes/commitsToArticles';
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

  commits: Commit[] = [];
  groups: Group[] = [];
  selectedCommit: Commit;

  constructor(private commitService: CommitService, private commitsToArticlesService: CommitsToArticlesService,
    private commitsToSongsService: CommitsToSongsService, private cmService: CommonMessageService, 
    private _snackBar: MatSnackBar,public dialog: MatDialog) {
    this.getCommits();
  }

  ngOnInit(): void {
  }

  getCommits(): void {
    try {
      this.commitService.getCommits()
        .subscribe(commits => {
          this.commits = commits;
          this.commits.sort((a, b) => Math
            .round(new Date(b.date).getTime() - new Date(a.date).getTime()));
          this.groupingByDate();
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  groupingByDate(): void {
    this.commits.forEach(commit => {
      let date = new Date(commit.date);
      let today = new Date();
      date.setHours(0, 0, 0, 0);
      today.setHours(0, 0, 0, 0);
      if (this.calculateDiff(date) == 0) { //new Date(date) == today
        this.addItemToGroup("היום", commit);
      }
      else if (this.calculateDiff(date) == 1) { //new Date(date) == new Date(today.setDate(today.getDate() - 1))
        this.addItemToGroup("אתמול", commit);
      }
      else if (this.isInCurrentWeek(date)) {
        this.addItemToGroup("השבוע", commit);
      }
      else if (this.isInAnOneWeekAgo(date)) {
        this.addItemToGroup("שבוע שעבר", commit);
      }
      else if (this.isInCurrentMonth(date)) {
        this.addItemToGroup("מוקדם יותר החודש", commit); //19
      }
      else if (new Date(date).getFullYear() == today.getFullYear()) {
        this.addItemToGroup("מוקדם יותר השנה", commit);
      }
      else {
        this.addItemToGroup("לפני זמן רב", commit);
      }
    });
    console.log(this.groups);
  }

  addItemToGroup(name: string, item: Commit): void {
    let exist: boolean = false;
    this.groups.forEach(group => {
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
      this.groups.push(g);
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
    this.changeSigning(commit, true);
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
            this.singCommit(commit);
          }
          else this.openSnackBar(this.cmService.COMMIT_SIGNING.FAIL);
        }, err => this.openSnackBar(this.cmService.COMMIT_SIGNING.ERROR));
      } catch (err) { console.log(err); }
    }
    else if (commit.type == "song"){
      try {
        this.commitsToSongsService.updateIsTested(commit.id, isSign).subscribe(result => {
          if (result == true) {
            this.openSnackBar(this.cmService.COMMIT_SIGNING.SUCCESS);
            this.singCommit(commit);
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
    this.groups.forEach(element => {
      if (element.list.includes(commit, 0)) {
        let index = element.list.indexOf(commit);
        element.list.splice(index, 1);
      }
    });
  }

  singCommit(commit: Commit) {
    this.commitService.getCommitById(commit.id, commit.type).subscribe(updateCommit =>
      this.groups.forEach(element => {
        if (element.list.includes(commit, 0))
          element.list[element.list.indexOf(commit)] = updateCommit;
      }));
  }
  openMessageDialog(text: string,commit:Commit) {
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
  stam(commit:Commit){
    console.log(commit);
  }

}
