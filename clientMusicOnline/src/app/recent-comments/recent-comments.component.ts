import { Component, OnInit } from '@angular/core';
import { ResponseService } from '../services/response.service';
import { Response } from '../classes/response';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'recent-comments',
  templateUrl: './recent-comments.component.html',
  styleUrls: ['./recent-comments.component.css']
})
export class RecentCommentsComponent implements OnInit {

  responsesList: Response[] = [];

  constructor(private responseService: ResponseService) { 
    this.responseService.getResponses().subscribe(response => {this.responsesList = response; this.filter();}, err => { console.log(err); });
   }

  ngOnInit() {
  }

  filter(): void {
    console.log(this.responsesList);
    this.responsesList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.responsesList = this.responsesList.slice(0, 5);
  }

}
