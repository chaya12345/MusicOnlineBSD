import { Component, OnInit } from '@angular/core';
import { LastesResponsView } from '../classes/lastesResponsView';
import { LatestResponsesService } from '../services/latest-responses.service';

@Component({
  selector: 'f-commits',
  templateUrl: './f-commits.component.html',
  styleUrls: ['./f-commits.component.css', './../f-style.css']
})
export class FCommitsComponent implements OnInit {

  lastestCommits: LastesResponsView[] = [];

  constructor(private latestResponsesService: LatestResponsesService) {
    this.getLatestCommits();
  }

  ngOnInit(): void {
  }

  getLatestCommits(): void {
    try {
      this.latestResponsesService.getLastResponsesToArticlesAndSongs()
        .subscribe(lastResponses => {
          this.lastestCommits = lastResponses;
          this.lastestCommits = this.lastestCommits.slice(0, 5);
        }, err => console.log(err));
    }
    catch (err) { console.log(err); }
  }

}
