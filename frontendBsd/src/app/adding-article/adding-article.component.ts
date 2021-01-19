import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { Artist } from '../classes/artist';
import { Singer } from '../classes/singer';
import { TagsForArticles } from '../classes/tag';
import { ArtistService } from '../services/artist.service';
import { SingerService } from '../services/singer.service';
import { TagService } from '../services/tag.service';

@Component({
  selector: 'adding-article',
  templateUrl: './adding-article.component.html',
  styleUrls: ['./adding-article.component.css']
})
export class AddingArticleComponent implements OnInit {

  articleHeadlines: FormGroup;

  uploadingImage: FormGroup;
  imageFile: File;

  articleTagging: FormGroup;
  singers: Singer[] = [];
  artists: Artist[] = [];
  tags: TagsForArticles[] = [];

  constructor(private singerService: SingerService, private artistService: ArtistService, private tagService: TagService) {
    this.articleHeadlines = new FormGroup({
      title: new FormControl("", [Validators.required, Validators.minLength(3)]),
      subtitle: new FormControl("", [Validators.minLength(3), Validators.required])
    });
    this.uploadingImage = new FormGroup({
      image: new FormControl("", Validators.required)
    });
    this.articleTagging = new FormGroup({
      singers: new FormControl(""),
      artists: new FormControl(""),
      tags: new FormControl("", Validators.required)
    });
    this.getSingers();
    this.getArtists();
    this.getTags();
  }

  ngOnInit(): void {
  }

  getSingers() {
    try {
      this.singerService.getSingers().subscribe(singersList => this.singers = singersList, err => console.log(err));
    } catch (err) { console.log(err) }
  }

  getArtists() {
    try {
      this.artistService.getArtists().subscribe(artistsList => this.artists = artistsList, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getTags() {
    try {
      this.tagService.getTagsForArticles().subscribe(tagsList => this.tags = tagsList, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getError(field: AbstractControl): string {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    else if (field.hasError("minLength"))
      return "שם לא תקין. (פחות מ-3 תוים)";
    else return "";
  }

  getTitleErrorMessage(): string {
    let message: string = this.getError(this.articleHeadlines.controls.title);
    return message;
  }

  getSubtitleErrorMessage(): string {
    let message: string = this.getError(this.articleHeadlines.controls.subtitle);
    return message;
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.uploadingImage.controls.image.setValue(fileToUpload.name);
  }

  confirm(){
    
  }
}
