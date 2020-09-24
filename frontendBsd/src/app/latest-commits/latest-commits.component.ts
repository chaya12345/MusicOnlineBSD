import { Component, OnInit } from '@angular/core';
import { LastResponsView } from '../classes/lastResponsView';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'latest-commits',
  templateUrl: './latest-commits.component.html',
  styleUrls: ['./latest-commits.component.css']
})
export class LatestCommitsComponent implements OnInit {

  lastResponsesView: LastResponsView[];

  constructor(private resToArticlesService: ResponsesToArticlesService) {
    try {
      this.resToArticlesService.getLast5Responses().subscribe(LastRespons =>{ this.lastResponsesView = LastRespons; }, err => console.log(err));
    }
    catch { console.log("erroe in latestCommitsComponent") }
  }

  ngOnInit() {
  }

}
