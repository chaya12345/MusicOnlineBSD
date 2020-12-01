import { Component, OnInit } from '@angular/core';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'm-magazine',
  templateUrl: './m-magazine.component.html',
  styleUrls: ['./m-magazine.component.css', './../m-style.css']
})
export class MMagazineComponent implements OnInit {

  magazine: Article[] = [];

  constructor(private articleService: ArticleService) {
    this.getArticles();
  }

  ngOnInit(): void {
  }

  getArticles(): void {
    try {
      this.articleService.getArticles().subscribe(magazine => {
        this.magazine = magazine;
        this.magazine.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.magazine = this.magazine.slice(0, 5);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
