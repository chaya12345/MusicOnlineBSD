import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { startWith, map } from 'rxjs/operators';
import { Article } from '../classes/article';
import { ArticleService } from '../services/article.service';
import { CommonMessageService } from '../services/common-message.service';

@Component({
  selector: 'deleting-article',
  templateUrl: './deleting-article.component.html',
  styleUrls: ['./deleting-article.component.css']
})
export class DeletingArticleComponent implements OnInit {

  @ViewChild("autoArticles") autoArticles: ElementRef;

  articleFormGroup: FormGroup;
  articleSelected: Article;
  articlesList: Article[] = [];
  filteredArticles: Observable<Article[]>;
  articleSelectedTitle: string;

  constructor(private articleService: ArticleService, private _snackBar: MatSnackBar, private cmService: CommonMessageService) {
    this.articleFormGroup = new FormGroup({
      article: new FormControl("", Validators.required)
    });
    this.getArticles();
  }

  ngOnInit(): void {
  }

  getArticles(): void {
    this.articleService.getArticles().subscribe(
      articles => {
        this.articlesList = articles;
        this.articlesList.sort((a, b) => a.title.localeCompare(b.title));
        this.updateArticlesList();
      }, err => console.log(err));
  }

  selectingArticle(article: string): void {
    this.articleSelectedTitle = article;
  }

  confirm(): void {
    try {
      this.getArticleByTitle();
      this.articleService.deleteArticle(this.articleSelected.id)
        .subscribe(res => {
          this.openSnackBar(res ? this.cmService.DELETE_ITEM.SUCCESS :
            this.cmService.DELETE_ITEM.FAIL);
          window.location.reload();
        }, () => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch { this.openSnackBar(this.cmService.DELETE_ITEM.ERROR); }
  }

  getArticleByTitle() {
    for (let i = 0; i < this.articlesList.length; i++) {
      if (this.articlesList[i].title == this.articleSelectedTitle) {
        this.articleSelected = this.articlesList[i];
        break;
      }
    }
  }

  openSnackBar(message: string): void {
    this._snackBar.open(message, '', {
      duration: 2000
    });
  }

  reset(): void {
    this.articleFormGroup.reset({ value: "" });
    this.articleSelected = null;
  }

  updateArticlesList(): void {
    this.filteredArticles = this.articleFormGroup.controls.article.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterArticles(value)));
  }

  _filterArticles(value: string): Article[] {
    const filterValue = value.toLocaleLowerCase();
    return this.articlesList.filter(article => article.title.toLocaleLowerCase().includes(filterValue));
  }

}
