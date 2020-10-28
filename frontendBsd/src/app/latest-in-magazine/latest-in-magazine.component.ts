import { Component, OnInit } from '@angular/core';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'latest-in-magazine',
  templateUrl: './latest-in-magazine.component.html',
  styleUrls: ['./latest-in-magazine.component.css']
})
export class LatestInMagazineComponent implements OnInit {

  latestArticles: Article[] = [];

  constructor(private articleService: ArticleService) { 
    this.getArticles();
  }

  ngOnInit(): void {
  }

  getArticles(): void {
    try {
    this.articleService.getArticles().subscribe(article => { this.latestArticles = article;
    this.latestArticles.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime())); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

}
