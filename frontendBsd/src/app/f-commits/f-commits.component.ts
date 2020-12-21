import { Component, OnInit } from '@angular/core';
import { Commit } from '../classes/commit';
import { LatestCommitsService } from '../services/latest-commits.service';

@Component({
  selector: 'f-commits',
  templateUrl: './f-commits.component.html',
  styleUrls: ['./f-commits.component.css', './../f-style.css']
})
export class FCommitsComponent implements OnInit {

  lastestCommits: Commit[] = [];

  constructor(private latestCommitsService: LatestCommitsService) {
    this.getLatestCommits();
  }

  ngOnInit(): void {
  }

  getLatestCommits(): void {
    try {
      this.latestCommitsService.getLastCommitsToArticlesAndSongs()
        .subscribe(lastCommits => {
          this.lastestCommits = lastCommits;
          this.lastestCommits = this.lastestCommits.slice(0, 5);
        }, err => console.log(err));
    }
    catch (err) { console.log(err); }
  }

}
