import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Article } from '../classes/article';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { ArticleService } from '../services/article.service';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';
import { TagsToArticlesService } from '../services/tags-to-articles.service';

@Component({
  selector: 'full-article',
  templateUrl: './full-article.component.html',
  styleUrls: ['./full-article.component.css']
})
export class FullArticleComponent implements OnInit {

  currentArticle: Article;
  tags: string[] = [];
  responses: ResponsesToArticles[] = [];

  constructor(private activatedRoute: ActivatedRoute, private articleService: ArticleService,
    private tagsToArticlesService: TagsToArticlesService, private responsesToArticlesService: ResponsesToArticlesService) { }

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      this.initialiseState();
    });
  }
  
  initialiseState(): void {
    this.articleService.getArticleById(parseInt(this.activatedRoute.snapshot.paramMap.get('id')))
      .subscribe(article => { this.currentArticle = article; this.reloadData(); }, err => { console.log(err); });
  }

  reloadData(): void {
    this.getTags();
  }

  getTags(): void {
    this.tagsToArticlesService.getTagsNamesToArticle(this.currentArticle.id)
      .subscribe(article => { this.tags = article; this.reloadData(); }, err => { console.log(err); });
  }

  getResponses(): void {
    this.responsesToArticlesService.getArticleResponses(this.currentArticle.id)
      .subscribe(response => { this.responses = response; console.log('res'); console.log(this.responses); }, err => { console.log(err); });
  }

}
