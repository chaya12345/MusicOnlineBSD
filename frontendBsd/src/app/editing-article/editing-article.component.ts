import { HttpClient } from '@angular/common/http';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { startWith, map } from 'rxjs/operators';
import { Article } from '../classes/article';
import { Singer } from '../classes/singer';
import { TagsForArticles } from '../classes/tag';
import { ArticleService, ArticleObj } from '../services/article.service';
import { CommonMessageService } from '../services/common-message.service';
import { SingerService } from '../services/singer.service';
import { SingersToArticleService } from '../services/singers-to-article.service';
import { TagService } from '../services/tag.service';
import { TagsToArticlesService } from '../services/tags-to-articles.service';

@Component({
  selector: 'editing-article',
  templateUrl: './editing-article.component.html',
  styleUrls: ['./editing-article.component.css']
})
export class EditingArticleComponent implements OnInit {

  articleFormGroup: FormGroup;
  detailsFormGroup: FormGroup;
  imageFormGroup: FormGroup;
  contentFormGroup: FormGroup;
  singersFormGroup: FormGroup;
  tagsFormGroup: FormGroup;


  @ViewChild("autoArticles") autoArticles: ElementRef;
  articleSelected: Article;
  articlesList: Article[] = [];
  filteredArticles: Observable<Article[]>;

  @ViewChild("autoSingers") autoSingers: ElementRef;
  singersList: Singer[] = [];
  filteredSingers: Observable<Singer[]>;
  selectedSingers: Singer[] = [];

  @ViewChild("autoTags") autoTags: ElementRef;
  filteredTags: Observable<TagsForArticles[]>;
  tagsList: TagsForArticles[] = [];
  selectedTags: TagsForArticles[] = [];

  imageFile: File;
  image: string;
  text: string = "";

  constructor(private singerService: SingerService, private tagService: TagService,
    private _snackBar: MatSnackBar, private cmService: CommonMessageService,
    private articleService: ArticleService, private httpClient: HttpClient,
    private tagsToArticleService: TagsToArticlesService,
    private singersToArticleService: SingersToArticleService) {
    this.articleFormGroup = new FormGroup({
      article: new FormControl("", Validators.required)
    });
    this.detailsFormGroup = new FormGroup({
      title: new FormControl("", [Validators.required, Validators.minLength(3)]),
      subtitle: new FormControl("", [Validators.required, Validators.minLength(3)])
    });
    this.imageFormGroup = new FormGroup({
      image: new FormControl("", Validators.required)
    });
    this.contentFormGroup = new FormGroup({
      content: new FormControl("")
    });
    this.singersFormGroup = new FormGroup({
      singer: new FormControl(""),
      singers: new FormControl("")
    });
    this.tagsFormGroup = new FormGroup({
      tag: new FormControl(""),
      tags: new FormControl("", [Validators.required, Validators.minLength(1)])
    });
    this.getArticles();
    this.getSingers();
    this.getTags();
  }

  ngOnInit(): void {
  }

  confirm(): void {
    try {
      let articleObj = new ArticleObj();
      let article = new Article();
      let content: string = (document.getElementsByClassName("custom-editor-edit")[0] as HTMLElement).innerHTML.toString();
      article.id = this.articleSelected.id;
      article.title = this.detailsFormGroup.controls.title.value;
      article.subtitle = this.detailsFormGroup.controls.subtitle.value;
      if (this.imageFile != undefined && this.imageFile != null) {
        article.image = "for_articles/" + this.imageFile.name;
      }
      else {
        article.image = this.articleSelected.image;
      }
      article.content = "articles_content/" + this.formatToFolderName(article.title) + ".txt";
      let singers: string[] = [];
      this.selectedSingers.forEach(singer => singers.push(singer.name));
      let tags: string[] = [];
      this.selectedTags.forEach(tag => tags.push(tag.name));
      articleObj.article = article;
      articleObj.singers = singers;
      articleObj.tags = tags;
      this.articleService.addArticle(articleObj, this.imageFile, content.toString(), true)
        .subscribe(res => this.openSnackBar(res ? this.cmService.UPDATE_ITEM.SUCCESS :
          this.cmService.UPDATE_ITEM.ERROR),
          () => this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR));
    } catch { this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR); }
  }

  formatToFolderName(name: string): string {
    let nonValidSigns: string = "%#@*:,/$!?^=;()`~.";
    for (let i = 0; i < nonValidSigns.length; i++) {
      name = name.trim().split(nonValidSigns[i] + "").join("");
    }
    return name.trim().split(' ').join('-');
  }

  getArticles(): void {
    this.articleService.getArticles().subscribe(
      articles => {
        this.articlesList = articles;
        this.articlesList.sort((a, b) => a.title.localeCompare(b.title));
        this.updateArticlesList();
      }, err => console.log(err));
  }

  getSingers(): void {
    try {
      this.singerService.getSingers()
        .subscribe(singers => {
          this.singersList = singers;
          this.orderByName(this.singersList);
          this.updateSingersList();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  getTags() {
    try {
      this.tagService.getTagsForArticles()
        .subscribe(tags => {
          this.tagsList = tags;
          this.orderByName(this.tagsList);
          this.updateTagsList();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  selectImage(fileToUpload: File): void {
    this.imageFile = fileToUpload;
    this.imageFormGroup.controls.image.setValue(this.imageFile);
  }

  public updateSingersList(): void {
    this.filteredSingers = this.singersFormGroup.controls.singer.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSingers(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.singersList.filter(singer => singer.name.toLowerCase().includes(filterValue));
  }

  public updateTagsList(): void {
    this.filteredTags = this.tagsFormGroup.controls.tag.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterTags(value))
      );
  }

  selectingArticle(articleTitle: string): void {
    for (let i = 0; i < this.articlesList.length; i++) {
      if (this.articlesList[i].title == articleTitle) {
        this.articleSelected = this.articlesList[i];
        this.fillingForm();
        break;
      }
    }
  }

  fillingForm(): void {
    this.detailsFormGroup.controls.title.setValue(this.articleSelected.title);
    this.detailsFormGroup.controls.subtitle.setValue(this.articleSelected.subtitle);
    this.imageFormGroup.controls.image.setValue(this.articleSelected.image);
    this.contentFormGroup.controls.content.setValue(this.articleSelected.content);
    this.image = "../../assets/images/" + this.articleSelected.image;
    this.getContent();
    this.getTagsOfArticle();
    this.getSingersOfArticle();
  }

  getContent(): void {
    this.httpClient.get("../../assets/text/" + this.articleSelected.content, {
      responseType: 'text'
    }).subscribe(data => { this.text = data; });
  }

  getTagsOfArticle(): void {
    try {
      this.selectedTags = [];
      this.tagsToArticleService.getTagsNamesToArticle(this.articleSelected.id)
        .subscribe(tags => {
          this.tagsFormGroup.controls.tags.setValue(tags);
          tags.forEach(tagName => {
            this.tagsList.forEach(tag => {
              if (tag.name == tagName) {
                this.selectedTags.push(tag);
              }
            });
          });
        });
    } catch (err) { console.log(err); }
  }

  getSingersOfArticle(): void {
    try {
      this.selectedSingers = [];
      this.singersToArticleService.getSingersToArticle(this.articleSelected.id)
        .subscribe(singers => {
          console.log(singers);
          this.singersFormGroup.controls.singers.setValue(singers);
          singers.forEach(singerName => {
            this.singersList.forEach(singer => {
              if (singer.name == singerName) {
                this.selectedSingers.push(singer);
              }
            });
          });
        });
    } catch (err) { console.log(err); }
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

  addSinger(): void {
    let singerName = this.singersFormGroup.controls.singer.value;
    if (singerName != null && singerName != "") {
      this.singersList.forEach(singer => {
        if (singer.name == singerName && this.notDuplicate(singer, this.selectedSingers)) {
          this.selectedSingers.push(singer);
        }
        else if (singer.name == singerName) {
          this.openSnackBar("הזמר שנבחר כבר קיים")
        }
      });
      this.updateSingersControl();
      this.singersFormGroup.controls.singer.setValue("");
    }
  }

  clearSinger(singer: Singer): void {
    this.selectedSingers.splice(this.selectedSingers.indexOf(singer), 1);
    this.updateSingersControl();
  }

  updateSingersControl(): void {
    this.singersFormGroup.controls.singers.setValue(this.selectedSingers);
  }

  addTag(): void {
    let tagName = this.tagsFormGroup.controls.tag.value;
    if (tagName != null && tagName != "") {
      this.tagsList.forEach(tag => {
        if (tag.name == tagName && this.notDuplicate(tag, this.selectedTags)) {
          this.selectedTags.push(tag);
        }
        else if (tag.name == tagName) {
          this.openSnackBar("התגית שנבחרה כבר קיימת")
        }
      });
      this.updateTagsControl();
      this.tagsFormGroup.controls.tag.setValue("");
    }
  }

  clearTag(tag: TagsForArticles): void {
    this.selectedTags.splice(this.selectedTags.indexOf(tag), 1);
    this.updateTagsControl();
  }

  updateTagsControl(): void {
    this.tagsFormGroup.controls.tags.setValue(this.selectedTags);
  }

  notDuplicate(artist: any, list: any[]): boolean {
    return !list.includes(artist);
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  public _filterTags(value: string): TagsForArticles[] {
    const filterValue = value.toLowerCase();
    return this.tagsList.filter(tag => tag.name.toLowerCase().includes(filterValue));
  }

  getTitleErrorMessage(): string {
    let message: string = this.getError(this.detailsFormGroup.controls.title);
    if (message != "") return message;
  }

  getSubtitleErrorMessage(): string {
    let message: string = this.getError(this.detailsFormGroup.controls.subtitle);
    if (message != "") return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    else if (field.hasError("minlength"))
      return "שם לא תקין. (מינימום 3-6 תווים בהתאם לסוג השדה)";
    else if (field.hasError("maxLength"))
      return "שם חורג ממגבלת התווים"
    return "";
  }

}
