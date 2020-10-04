import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'latest-in-magazine',
  templateUrl: './latest-in-magazine.component.html',
  styleUrls: ['./latest-in-magazine.component.css']
})
export class LatestInMagazineComponent implements OnInit {

  anotherVersion: boolean = false;
  latestArticles: Article[] = [];

  constructor(private articleService: ArticleService, private router:Router) { 
    try {
    this.articleService.getArticles().subscribe(article => { this.latestArticles = article; this.filter(); }, err => { console.log(err); });
    }
    catch { console.log('magazine'); }
  }

  ngOnInit(): void {
    if (this.router.url.includes("song")) {
      this.anotherVersion = true;
    }
  }

  filter(): void {
    this.latestArticles.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.latestArticles = this.latestArticles.slice(0, 3);
  }

}
