import { Component, Input, OnInit } from '@angular/core';
import { Article } from '../classes/article';

@Component({
  selector: 'articles',
  templateUrl: './articles.component.html',
  styleUrls: ['./articles.component.css']
})
export class ArticlesComponent implements OnInit {

  @Input() articles: Article[] = [];
  @Input() count?: number;

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.count != null && this.count != undefined) {
      this.articles = this.articles.slice(0, this.count);
    }
  }

}
