import { Component, OnInit } from '@angular/core';
import { CommitService } from '../services/commit.service';

@Component({
  selector: 'commits-board',
  templateUrl: './commits-board.component.html',
  styleUrls: ['./commits-board.component.css']
})
export class CommitsBoardComponent implements OnInit {

  constructor(private commitService: CommitService) { 
    this.getCommits();
  }

  ngOnInit(): void {
  }

  getCommits(): void {
    try {

    } catch (err) { console.log(err); }
  }

}
