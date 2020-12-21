import { Component, OnInit } from '@angular/core';
import { Commit } from '../classes/commit';
import { CommitService } from '../services/commit.service';

@Component({
  selector: 'commits-board',
  templateUrl: './commits-board.component.html',
  styleUrls: ['./commits-board.component.css']
})
export class CommitsBoardComponent implements OnInit {

  commits: Commit[] = [];

  constructor(private commitService: CommitService) {
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
          console.log(this.commits[0].date);
          console.log(this.calculateDiff(this.commits[0].date));
          console.log(this.isInCurrentWeek(this.commits[0].date));
          console.log(this.isInCurrentWeek(this.commits[1].date));
          console.log(this.isInCurrentMonth(this.commits[0].date));
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  calculateDiff(dateSent) {
    let currentDate = new Date();
    dateSent = new Date(dateSent);

    return Math.floor((Date.UTC(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate())
      - Date.UTC(dateSent.getFullYear(), dateSent.getMonth(), dateSent.getDate())) / (1000 * 60 * 60 * 24));
  }

  isInCurrentWeek(date: Date): boolean {
    // var curr = new Date;
    // var first = curr.getDate() - curr.getDay();
    // var last = first + 6;
    // var firstday = new Date(curr.setDate(first)).toUTCString();
    // var lastday = new Date(curr.setDate(last)).toUTCString();
    // if (Date.parse(firstday) < Date.parse(date.toUTCString()) &&
    //   Date.parse(date.toUTCString()) < Date.parse(lastday)) {
    //   return true;
    // }
    // return false;
    var curr = new Date;
    var firstday = new Date(curr.setDate(curr.getDate() - curr.getDay()));
    console.log(firstday);
    if (firstday >= date) {
      return true;
    }
    return false;
  }

  isInCurrentMonth(date: Date): boolean {
    var currDate = new Date();
    var firstDay = new Date(currDate.getFullYear(), currDate.getMonth(), 1);
    var lastDay = new Date(currDate.getFullYear(), currDate.getMonth() + 1, 0);
    if (Date.parse(firstDay.toUTCString()) < Date.parse(date.toUTCString()) &&
      Date.parse(date.toUTCString()) < Date.parse(lastDay.toUTCString())) {
      return true;
    }
    return false;
  }

}
