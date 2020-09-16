import { Component, OnInit } from '@angular/core';
import { LastResponsView } from '../classes/lastResponsView';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'latest-commits',
  templateUrl: './latest-commits.component.html',
  styleUrls: ['./latest-commits.component.css']
})
export class LatestCommitsComponent implements OnInit {
  lastResponsView: LastResponsView[];
  constructor(private responsesToArticlesService: ResponsesToArticlesService) {
    try {
      responsesToArticlesService.getLast5Responses().subscribe(LastRespons =>{ this.lastResponsView = LastRespons;/*console.log(this.lastResponsView);*/}, err => console.log(err));
    }
    catch { console.log("erroe in latestCommitsComponent") }
  }

  ngOnInit() {
  }

}
