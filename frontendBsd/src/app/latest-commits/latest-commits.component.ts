import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LastesResponsView } from '../classes/lastesResponsView';
import { LatestResponsesService } from '../services/latest-responses.service';

@Component({
  selector: 'latest-commits',
  templateUrl: './latest-commits.component.html',
  styleUrls: ['./latest-commits.component.css']
})
export class LatestCommitsComponent implements OnInit {

  lastCommits: LastesResponsView[];

  constructor(private latestResponsesService: LatestResponsesService, private router: Router) {
    try {
      this.latestResponsesService.getLastResponsesToArticlesAndSongs()
        .subscribe(lastResponses => { this.lastCommits = lastResponses; this.updateList(); }, err => console.log(err));
    }
    catch (err) { console.log(err); }
  }

  ngOnInit() {
  }

  updateList(): void {
    this.lastCommits = this.lastCommits.slice(0, 7);
  }

  getResponse(commit: LastesResponsView) {
    // if (commit.type == 'article')
    //   this.router.navigateByUrl("article/" + commit.topicId);
    // else this.router.navigateByUrl("song/" + commit.topicId);
  }

}
