import { Component, Input, OnInit } from '@angular/core';
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
  @Input() vertical?: boolean = false;
  num: number = 1;

  constructor(private likeService: LikeService, private articleService: ArticleService) { }

  ngOnInit() {
    window.addEventListener('scroll', this.scroll, true);
    this.addAnimation();
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

  ngOnDestroy() {
      window.removeEventListener('scroll', this.scroll, true);
  }

  scroll = (event): void => {
    this.addAnimation();
  };
  
  elementInViewport(el) {
    var top = el.offsetTop;
    var left = el.offsetLeft;
    var width = el.offsetWidth;
    var height = el.offsetHeight;
  
    while(el.offsetParent) {
      el = el.offsetParent;
      top += el.offsetTop;
      left += el.offsetLeft;
    }
  
    return (
      top < (window.pageYOffset + window.innerHeight) &&
      left < (window.pageXOffset + window.innerWidth) &&
      (top + height) > window.pageYOffset &&
      (left + width) > window.pageXOffset
    );
  }

  addAnimation(): void {
    var wrappers = document.getElementsByClassName("wrap-latest-article");
    for (var i = 0; i < wrappers.length; i++) {
      if (this.elementInViewport(wrappers[i]) == true) {
      (wrappers[i] as HTMLElement).style.animationName = "bigger";
      }
    }
  }

}
