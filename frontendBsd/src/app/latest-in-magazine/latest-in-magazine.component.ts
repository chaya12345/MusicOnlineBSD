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
    try {
    this.articleService.getArticles().subscribe(article => { this.latestArticles = article; }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }

}
