import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Article } from '../classes/article';
import { Singer } from '../classes/singer';
import { TagsForArticles } from '../classes/tag';
import { ArticleObj, ArticleService } from '../services/article.service';
import { CommonMessageService } from '../services/common-message.service';
import { SingerService } from '../services/singer.service';
import { TagService } from '../services/tag.service';

@Component({
  selector: 'adding-a-article',
  templateUrl: './adding-a-article.component.html',
  styleUrls: ['./adding-a-article.component.css']
})
export class AddingAArticleComponent implements OnInit {

  detailsFormGroup: FormGroup;
  imageFormGroup: FormGroup;
  contentFormGroup: FormGroup;
  singersFormGroup: FormGroup;
  tagsFormGroup: FormGroup;

  @ViewChild("autoSingers") autoSingers: ElementRef;
  singersList: Singer[] = [];
  filteredSingers: Observable<Singer[]>;
  selectedSingers: Singer[] = [];
  
  @ViewChild("autoTags") autoTags: ElementRef;
  filteredTags: Observable<TagsForArticles[]>;
  tagsList: TagsForArticles[] = [];
  selectedTags: TagsForArticles[] = [];

  imageFile: File;

  constructor(private singerService: SingerService, private tagService: TagService,
    private _snackBar: MatSnackBar, private cmService: CommonMessageService,
    private articleService: ArticleService) {
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
      singers: new FormControl("", [Validators.required, Validators.minLength(1)])
    });
    this.tagsFormGroup = new FormGroup({
      tag: new FormControl(""),
      tags: new FormControl("", [Validators.required, Validators.minLength(1)])
    });
    this.getSingers();
    this.getTags();
  }

  ngOnInit(): void {
  }

  confirm(): void {
    try {
      let articleObj = new ArticleObj();
      let article = new Article();
      article.title = this.detailsFormGroup.controls.title.value;
      article.subtitle = this.detailsFormGroup.controls.subtitle.value;
      article.image = "for_articles/" + this.imageFile.name;
      article.content = "articles_content" + this.formatToFolderName(article.title);
      let singers: string[] = [];
      this.selectedSingers.forEach(singer => singers.push(singer.name));
      let tags: string[] = [];
      this.selectedTags.forEach(tag => tags.push(tag.name));
      articleObj.article = article;
      articleObj.singers = singers;
      articleObj.tags = tags;
      let content: string = (document.getElementsByClassName("custom-editor")[0] as HTMLElement).innerHTML.toString();
      this.articleService.addArticle(articleObj, this.imageFile, content.toString())
      .subscribe(res => this.openSnackBar(res ? this.cmService.GENERATE.ADD.SUCCESS :
        this.cmService.GENERATE.ADD.ERROR),
        () => this.openSnackBar(this.cmService.GENERATE.ADD.ERROR));
    } catch { this.openSnackBar(this.cmService.GENERATE.ADD.ERROR); }
  }

  formatToFolderName(singer: string): string {
    return singer.trim().split(' ').join('-');
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
