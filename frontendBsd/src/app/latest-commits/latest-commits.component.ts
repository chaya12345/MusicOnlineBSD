import { Component, OnInit } from '@angular/core';
import { LastResponsView } from '../classes/lastResponsView';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'latest-commits',
  templateUrl: './latest-commits.component.html',
  styleUrls: ['./latest-commits.component.css']
})
export class LatestCommitsComponent implements OnInit {

  lastCommits: LastResponsView[];

  constructor(private resToArticlesService: ResponsesToArticlesService) {
    try {
      this.resToArticlesService.getLast5Responses().subscribe(lastResponses =>{ this.lastCommits = lastResponses; }, err => console.log(err));
    }
    catch (err) { console.log(err); }
  }

  ngOnInit() {
  }

}
