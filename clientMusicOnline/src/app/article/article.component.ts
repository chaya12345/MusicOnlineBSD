import { Component, OnInit, Input } from '@angular/core';
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

  constructor(private likeService: LikeService) { }

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

}
