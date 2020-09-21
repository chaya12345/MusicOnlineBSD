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
  num: number = 1;

  constructor(private likeService: LikeService, private articleService: ArticleService) { }

  ngOnInit() {
  }

  sign(event): void {
    this.likeService.toggle_like(event);
    this.num++;
    this.num % 2 == 0 ? this.addLike() : this.MissLike();
  }

  marking(event, color?: string): void {
    this.likeService.change_like_color(event, color);
  }

  reset_marking(event, color: string): void {
    this.likeService.reset_like_color(event, color);
  }

  addLike(): void {
   this.article.count_like = this.article.count_like + 1;
    this.articleService.increaseLikeToArticle(this.article.id).subscribe();
  }

  MissLike(): void {
    this.article.count_like=this.article.count_like-1;
    this.articleService.decreaseLikeToArticle(this.article.id).subscribe();
  }

}
