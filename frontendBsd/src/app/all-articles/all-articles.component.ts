import { Component, OnInit } from '@angular/core';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'all-articles',
  templateUrl: './all-articles.component.html',
  styleUrls: ['./all-articles.component.css']
})
export class AllArticlesComponent implements OnInit {

  articlesList: Article[] = [];
  navs: string[] = [];

  constructor(private articleService:ArticleService) {
    try {
      this.articleService.getArticles().subscribe(articles => { this.articlesList = articles; this.orderByDate(); }, err => console.log(err));
    }
    catch (err) { console.log(err); }
    this.navs.push("מגזין");
  }

  ngOnInit() {
  }

  orderByDate(): void {
    this.articlesList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

}
