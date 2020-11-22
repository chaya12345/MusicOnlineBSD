import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { Artist } from '../classes/artist';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { Tag } from '../classes/tag';
import { ArtistService } from '../services/artist.service';
import { SingerService } from '../services/singer.service';
import { TagService } from '../services/tag.service';
import { UploadService } from '../services/upload.service';

@Component({
  selector: 'uploading-song',
  templateUrl: './uploading-song.component.html',
  styleUrls: ['./uploading-song.component.css']
})
export class UploadingSongComponent implements OnInit {

  uploadSong: FormGroup;
  singersList: Singer[] = [];
  imageFile: File;
  tagsList: Tag[] = [];
  artistsList: Artist[] = [];
  isPreformance:boolean=false;

  constructor(private singerService: SingerService, private tagService: TagService,
    private artistService: ArtistService,private uploadService: UploadService) {
    try {
      this.singerService.getSingers().subscribe(singers => this.singersList = singers, err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.tagService.getTags().subscribe(tags => this.tagsList = tags, err => console.log(err))
    } catch (err) { console.log(err); }
    try {
      this.artistService.getArtists().subscribe(artists => this.artistsList = artists, err => console.log(err));
    } catch (err) { console.log(err) }
    this.uploadSong = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2), Validators.maxLength(100)]),
      title: new FormControl("", [Validators.required, Validators.minLength(10), Validators.maxLength(150)]),
      subtitle: new FormControl("", [Validators.required, Validators.minLength(10)]),
      singers: new FormControl("", Validators.required),
      image: new FormControl("", Validators.required),
      tags: new FormControl("", Validators.required),
      artists: new FormControl("", Validators.required)
    })
  }

  ngOnInit(): void {
  }
  onSubmit(): void {
    let song: Song = new Song;
    song.name=this.uploadSong.controls.name.value;
    song.file_location=null;
    song.type=null;
    //song.date=null;
    //song.singerId=null;
    song.count_like=0;
    song.count_views=0;
    song.title=this.uploadSong.controls.title.value;
    song.subtitle=this.uploadSong.controls.title.value;
    song.image_location=null;
    song.content=null;
    song.isPerformance=this.isPreformance;
    let singers=this.uploadSong.controls.singers.value;
    let tags=this.uploadSong.controls.tags.value;
    let artists=this.uploadSong.controls.artists.value;

  }
  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.uploadSong.controls.image.setValue("for_songs/" + fileToUpload.name);
  }

  saveImage(fileToUpload: File): void {
    if (fileToUpload != null) {
      this.uploadService.postFile(fileToUpload, "for_songs").subscribe(
        res => console.log(res),
        error => console.log(error)
      );
    }
  }

  getNameErrorMessage(): string {
    let message: string = this.getError(this.uploadSong.controls.name);
    if (message != "") return message;
  }
  getTitleErrorMessage(): string {
    let message: string = this.getError(this.uploadSong.controls.title);
    if (message != "") return message;
  }
  getSubtitleErrorMessage(): string {
    let message: string = this.getError(this.uploadSong.controls.subtitle);
    if (message != "") return message;
  }
  getErrorMessage(): string {
    let message: string = this.getError(this.uploadSong.controls.singers);
    if (message != "") return message;
  }
  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    else if (field.hasError("minlength"))
      return "שם לא תקין. (פחות ממינימום תווים שנדרש)";
    else if (field.hasError("maxLength"))
      return "שם חורג ממגבלת התווים"
    return "";
  }

}
