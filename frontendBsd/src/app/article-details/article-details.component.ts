import { Component, OnDestroy, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { Article } from '../classes/article';
import { FollowUp } from '../classes/followUp';
import { User } from '../classes/user';
import { LogInComponent } from '../log-in/log-in.component';
import { ArticleService } from '../services/article.service';
import { CommonMessageService } from '../services/common-message.service';
import { FollowUpService } from '../services/follow-up.service';
import * as moment from "moment";

@Component({
  selector: 'article-details',
  templateUrl: './article-details.component.html',
  styleUrls: ['./article-details.component.css']
})
export class ArticleDetailsComponent implements OnInit, OnDestroy {

  article: Article;
  navs: string[] = [];
  similarArticles: Article[] = [];
  followupAdded: boolean = false;
  dateStart: any;

  constructor(private activatedRoute: ActivatedRoute, private articleService: ArticleService,
    private router: Router, private followUpService: FollowUpService, private _snackBar: MatSnackBar,
    private dialog: MatDialog, private commonMessage: CommonMessageService) {
    this.getCurrentArticle();
  }

  ngOnInit() {
    this.getSimilarResults();
    this.dateStart = moment();
    window.addEventListener("beforeunload", this.isViewed.bind(this));
  }

  isViewed() {
    debugger;
    let period = moment(moment()).diff(this.dateStart);
    if (period / 1000 >= 30) {
      this.addView();
    }
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
  }

  ngOnDestroy(): void {
    let period = moment.utc(moment(this.dateStart).diff(moment())).format("HH:mm:ss");
    localStorage.setItem("destroying", "yes");
    sessionStorage.setItem("period", period);
    debugger;
    console.log(period);
  }

  addView(): void {
    // TODO adding only in playing video or after 20 seconds
    try {
      let id: number = this.activatedRoute.snapshot.queryParams.articleId;
      this.articleService.addViewToArticle(id).subscribe();
    } catch (err) { console.log(err); }
    this.navs.push("מגזין");
  }

  getCurrentArticle(): void {
    try {
      let id: number = this.activatedRoute.snapshot.queryParams.articleId;
      this.articleService.getArticleById(id)
        .subscribe(article => {
          this.article = article;
          this.navs.push(this.article.title);
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getSimilarResults(): void {
    try {
      this.articleService.getArticles()
        .subscribe(article => {
          this.similarArticles = article;
          this.similarArticles = this.similarArticles.slice(0, 3);
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  toggleFollowUp(value: boolean) {
    if (this.article != null && this.isUserConnected()) {
      let user: User = JSON.parse(sessionStorage.getItem('user'));
      value == true ? this.addFollowUp(user) : this.removeFollowUp(user);
    }
    else { this.openLoginDialog(); }
  }

  isUserConnected(): boolean {
    return sessionStorage.getItem('user') != null
      && sessionStorage.getItem('user') != undefined;
  }

  addFollowUp(user: User): void {
    let followUp: FollowUp = new FollowUp();
    followUp.articleId = this.article.id;
    followUp.userId = user.id;
    try {
      this.followUpService.addFollowUp(followUp)
        .subscribe(result => {
          result == true ?
            this.openSnackBar(this.commonMessage.FOLLOW_UP.ADD.SUCCESS) :
            this.openSnackBar(this.commonMessage.FOLLOW_UP.ADD.FAIL);
          this.followupAdded = true;
        }, err => console.log(err));
    } catch (err) { console.log(err); this.openSnackBar(this.commonMessage.ERROR); }
  }

  removeFollowUp(user: User): void {
    try {
      this.followUpService.deleteFollowUp(user.id, this.article.id, "article").subscribe(
        result => {
          this.openSnackBar(result == true ?
            this.commonMessage.FOLLOW_UP.REMOVE.SUCCESS :
            this.commonMessage.FOLLOW_UP.REMOVE.FAIL);
          this.followupAdded = false;
        }, err => console.log(err)
      );
    } catch {
      this.openSnackBar(this.commonMessage.ERROR);
    }
  }

  openLoginDialog() {
    try {
      const dialogRef = this.dialog.open(LogInComponent, { width: '400px' });
      dialogRef.afterClosed().subscribe();
    } catch (err) { console.log(err); }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, "", { duration: 2000 });
  }

}
