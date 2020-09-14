import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { Article } from '../classes/article';
import { LikeService } from '../services/like.service';

@Component({
  selector: 'article',
  templateUrl: './article.component.html',
  styleUrls: ['./article.component.css']
})
export class ArticleComponent implements OnInit {

  @Input() article: Article;
  likeFunctionality;

  constructor(private likeService: LikeService, public router: Router) { }

  ngOnInit() {
    console.log(this.article);
    this.likeFunctionality = this.likeService;
  }

  sign(event): void {
    this.likeFunctionality.toggle_like(event);
  }

  marking(event): void {
    this.likeFunctionality.change_like_color(event);
  }

  reset_marking(event, color: string): void {
    this.likeFunctionality.reset_like_color(event, color);
  }

  fullArticle(): void {
    this.router.navigateByUrl('/article/' + this.pad(this.article.id, 5));
  }

  pad(num, size): string {
    var s = num + "";
    while (s.length < size) s = "0" + s;
    return s;
  }

}
