import { Component, OnInit } from '@angular/core';
import { ResponsesToArticlesService } from '../services/responsesToArticles.service';
import { ResponsesToArticles } from '../classes/responsesToArticles';

@Component({
  selector: 'recent-comments',
  templateUrl: './recent-comments.component.html',
  styleUrls: ['./recent-comments.component.css']
})
export class RecentCommentsComponent implements OnInit {

  responsesList: ResponsesToArticles[] = [];

  constructor(private responseService: ResponsesToArticlesService) { 
    try {
    this.responseService.getResponses().subscribe(response => {this.responsesList = response; this.filter();}, err => { console.log(err); });
    }
    catch { console.log('recent-comments'); }
   }

  ngOnInit() {
  }

  filter(): void {
    console.log(this.responsesList);
    this.responsesList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.responsesList = this.responsesList.slice(0, 5);
  }

}
