import { Component, Input, OnInit } from '@angular/core';
import { Article } from '../classes/article';

@Component({
  selector: 'latest-article',
  templateUrl: './latest-article.component.html',
  styleUrls: ['./latest-article.component.css']
})
export class LatestArticleComponent implements OnInit {

  @Input() article: Article;

  constructor() { }

  ngOnInit() {
    console.log('url(../../assets/images/'+this.article.main_image+')');
  }

}
