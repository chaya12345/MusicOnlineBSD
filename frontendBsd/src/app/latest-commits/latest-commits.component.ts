import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LastResponsView } from '../classes/lastResponsView';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'latest-commits',
  templateUrl: './latest-commits.component.html',
  styleUrls: ['./latest-commits.component.css']
})
export class LatestCommitsComponent implements OnInit {

  lastCommits: LastResponsView[];

  constructor(private resToArticlesService: ResponsesToArticlesService,private router:Router) {
    try {
      this.resToArticlesService.GetLastResponsesToArticlesAndSongs().subscribe(lastResponses =>{ this.lastCommits = lastResponses; }, err => console.log(err));
    }
    catch (err) { console.log(err); }
  }

  ngOnInit() {
  }
  getResponse(commit:LastResponsView){
    if(commit.type=='article')
    this.router.navigateByUrl("article/"+commit.topicId);
    else this.router.navigateByUrl("song/"+commit.topicId);
  }

}
