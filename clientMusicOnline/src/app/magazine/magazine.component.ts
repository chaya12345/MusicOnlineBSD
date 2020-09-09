import { Component, OnInit } from '@angular/core';
import { LikeService } from '../services/like.service';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'magazine',
  templateUrl: './magazine.component.html',
  styleUrls: ['./magazine.component.css'],
  providers: [LikeService]
})
export class MagazineComponent implements OnInit {

  articlesList: Article[] = [];
  likeFunctionality;

  constructor(private articleService: ArticleService, private likeService: LikeService) {
    this.articleService.getArticles().subscribe(article => { this.articlesList = article; this.filter(); }, err => { console.log(err); });
  }

  ngOnInit() {
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

  filter(): void {
    this.articlesList = this.articlesList.slice(0, 3);
  }

}
