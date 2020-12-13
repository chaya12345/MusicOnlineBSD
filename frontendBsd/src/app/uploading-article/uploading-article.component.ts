import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { Article } from '../classes/article';
import { Artist } from '../classes/artist';
import { Singer } from '../classes/singer';
import { Tag } from '../classes/tag';
import { ArticleService } from '../services/article.service';
import { ArtistService } from '../services/artist.service';
import { SingerService } from '../services/singer.service';
import { TagService } from '../services/tag.service';

@Component({
  selector: 'uploading-article',
  templateUrl: './uploading-article.component.html',
  styleUrls: ['./uploading-article.component.css']
})
export class UploadingArticleComponent implements OnInit {

  uploadingArticleForm: FormGroup;
  imageFile: File;
  singers: Singer[] = [];
  tags: Tag[] = [];
  artists: Artist[] = [];

  constructor(private singerService: SingerService, private tagService: TagService,
    private artistService: ArtistService, private articleService: ArticleService) {
    this.uploadingArticleForm = new FormGroup({
      title: new FormControl("", [Validators.required, Validators.minLength(3)]),
      subtitle: new FormControl("", [Validators.required, Validators.minLength(3)]),
      image: new FormControl("", Validators.required),
      singers: new FormControl("", Validators.required),
      tags: new FormControl("", Validators.required),
      artists: new FormControl("", Validators.required),
      content: new FormControl("", [Validators.required, Validators.minLength(3)])
    });
    this.getSingers();
    this.getTags();
    this.getArtists();
  }

  ngOnInit(): void {
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.uploadingArticleForm.controls.image.setValue(fileToUpload.name);
  }

  onSubmit(): void {
    if (this.uploadingArticleForm.valid && this.imageFile != null && this.imageFile != undefined) {
      let article: Article = new Article();
      article.title = this.uploadingArticleForm.controls.title.value;
      article.subtitle = this.uploadingArticleForm.controls.subtitle.value;
      article.image = "for_articles/" + this.uploadingArticleForm.controls.image.value;
      try {
      this.articleService.addArticle(article).subscribe(res => 
        console.log(res), err => console.log(err));
      } catch (err) { console.log(err); }
      // this.reset();
    }
  }

  reset() {
    this.uploadingArticleForm.reset({ value: "" });
  }

  getTitleErrorMessage() {
    let message: string = this.getError(this.uploadingArticleForm.controls.title);
    if (message != "") return message;
  }

  getSubtitleErrorMessage() {
    let message: string = this.getError(this.uploadingArticleForm.controls.subtitle);
    if (message != "") return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    else if (field.hasError("minlength"))
      return "שם לא תקין. (פחות מ-3 תווים)";
    return "";
  }

  getSingers(): void {
    try {
      this.singerService.getSingers().subscribe(singers => {
        this.singers = singers;
        this.singers.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getTags(): void {
    try {
      this.tagService.getTags().subscribe(tags => {
        this.tags = tags;
        this.tags.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getArtists(): void {
    try {
      this.artistService.getArtists().subscribe(artists => {
        this.artists = artists;
        this.artists.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
