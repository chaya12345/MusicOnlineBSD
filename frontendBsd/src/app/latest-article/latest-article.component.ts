import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';
import { LikeService } from '../services/like.service';

@Component({
  selector: 'latest-article',
  templateUrl: './latest-article.component.html',
  styleUrls: ['./latest-article.component.css']
})
export class LatestArticleComponent implements OnInit {

  @Input() article: Article;
  likeFunctionality;
  num: number = 1;

  constructor(private likeService: LikeService, private articleServicer: ArticleService) { }

  ngOnInit() {
    this.likeFunctionality = this.likeService;
  }

  sign(event): void {
    this.likeFunctionality.toggle_like(event);
    this.num++;
    this.num % 2 == 0 ? this.addLike() : this.MissLike();
  }

  marking(event, color: string): void {
    this.likeFunctionality.change_like_color(event, color);
  }

  reset_marking(event, color: string): void {
    this.likeFunctionality.reset_like_color(event, color);
  }
  addLike(): void {
   this.article.count_like = this.article.count_like + 1;
    this.articleServicer.increaseLikeToArticle(this.article.id).subscribe();
  }
  MissLike(): void {
    this.article.count_like=this.article.count_like-1;
    this.articleServicer.decreaseLikeToArticle(this.article.id).subscribe();
  }

}
