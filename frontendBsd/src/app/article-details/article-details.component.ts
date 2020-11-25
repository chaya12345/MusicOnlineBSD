import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { Article } from '../classes/article';
import { FollowUp } from '../classes/followUp';
import { User } from '../classes/user';
import { LogInComponent } from '../log-in/log-in.component';
import { ArticleService } from '../services/article.service';
import { FollowUpService } from '../services/follow-up.service';

@Component({
  selector: 'article-details',
  templateUrl: './article-details.component.html',
  styleUrls: ['./article-details.component.css']
})
export class ArticleDetailsComponent implements OnInit {

  article: Article;
  navs: string[] = [];
  similarArticles: Article[] = [];
  followupAdded: boolean = false;

  constructor(private activatedRoute: ActivatedRoute, private articleService: ArticleService,
    private router: Router, private followUpService: FollowUpService, private _snackBar: MatSnackBar,
    private dialog: MatDialog) {
    try {
      this.articleService.getArticleById(this.activatedRoute.snapshot.queryParams.articleId)
        .subscribe(article => { this.article = article; this.navs.push(this.article.title); }, err => console.log(err));
    } catch (err) { console.log(err); }
    //TO-DO
    // try{
    //   let id: number = Number(this.activatedRoute.snapshot.queryParams.articleId);
    //   articleService.addViewToArticle(id).subscribe();
    // }catch(err){console.log(err);}
    this.navs.push("מגזין");
  }

  ngOnInit() {
    this.getSimilarResults();
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
    if (this.article != null && sessionStorage.getItem('user') != null && sessionStorage.getItem('user') != undefined) {
      let user: User = JSON.parse(sessionStorage.getItem('user'));
      let followUp: FollowUp = new FollowUp();
      if (value == true) {
        followUp.articleId = this.article.id;
        followUp.userId = user.id;
        try {
          this.followUpService.addFollowUp(followUp)
            .subscribe(result => {
              if (result == true) {
                this.openSnackBar('המעקב נוסף בהצלחה');
                this.followupAdded = true;
              } else {
                this.openSnackBar("כבר קיים מעקב לכתובת המייל שהוזנה");
                this.followupAdded = true;
              }
            }, err => console.log(err));
        } catch (err) { console.log(err); this.openSnackBar('מצטערים, קרתה תקלה. נסה שוב מאוחר יותר'); }
      }
      else {
        try {
          this.followUpService.deleteFollowUp(user.id, this.article.id, "article").subscribe(
            result => {
              if (result == true) {
                this.openSnackBar("המעקב הוסר בהצלחה");
                this.followupAdded = false;
              } else {
                this.openSnackBar("לא קיים מעקב לכתובת המייל שהוזנה");
                this.followupAdded = false;
              }
            }, err => console.log(err)
          );
        } catch (err) { console.log(err); this.openSnackBar('מצטערים, קרתה תקלה. נסה שוב מאוחר יותר'); }
      }
    }
    else {
      this.openLoginDialog();
    }
  }
  openLoginDialog() {
    try {
      const dialogRef = this.dialog.open(LogInComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => { });
    } catch (err) { console.log(err); }
  }
  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
