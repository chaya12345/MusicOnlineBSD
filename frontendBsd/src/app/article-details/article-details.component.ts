import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'article-details',
  templateUrl: './article-details.component.html',
  styleUrls: ['./article-details.component.css']
})
export class ArticleDetailsComponent implements OnInit {

  article: Article;
  navs: string[] = [];
  similarArticles: Article[] = [];

  constructor(private activatedRoute: ActivatedRoute, private articleService: ArticleService,
    private httpClient: HttpClient, private router: Router) {
    try {
      this.articleService.getArticleById(this.activatedRoute.snapshot.queryParams.articleId)
        .subscribe(article => { this.article = article; this.navs.push(this.article.title); }, err => console.log(err));
    } catch (err) { console.log(err); }
    this.navs.push("מגזין");
  }

  ngOnInit() {
  }

  onRefresh() {
    this.router.routeReuseStrategy.shouldReuseRoute = function () { return false; };
    let currentUrl = this.router.url + '?';
    this.router.navigateByUrl(currentUrl)
      .then(() => {
        this.router.navigated = false;
        this.router.navigate([this.router.url]);
      });
  }

  ngOnChanges(): void {
    this.navs.push(this.article.title);
    try {
      this.getSimilarResults();
    } catch { }
  }

  getSimilarResults(): void {
    try {
      this.articleService.getArticles()
        .subscribe(article => { this.similarArticles = article; this.filter(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  filter(): void {
    this.similarArticles = this.similarArticles.slice(0, 3);
  }

  addFollowUp(value: boolean) {
    /* ----- add follow up ---- */
  }

}
