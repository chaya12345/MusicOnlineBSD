import { Component, Input, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { Artist } from '../classes/artist';
import { ArtistWithJob } from '../classes/artistWithJob';
import { Job } from '../classes/job';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { TagsForSongs } from '../classes/tag';
import { SingerService } from '../services/singer.service';
import { SongService } from '../services/song.service';
import { TagService } from '../services/tag.service';

@Component({
  selector: 'app-song-form',
  templateUrl: './song-form.component.html',
  styleUrls: ['./song-form.component.css', './../admin-style.css']
})
export class SongFormComponent implements OnInit {

  @Input() song: Song;

  uploadSong: FormGroup;
  imageFile: File;
  songFile: File;
  singers: Singer[] = [];
  tags: TagsForSongs[] = [];
  artists: Artist[] = [];
  isPerformance: boolean = false;
  artistsWithJobs: ArtistWithJob[] = [];
  jobs: Job[] = [];
  text: string;

  constructor(private songService: SongService, private singerService: SingerService, private tagService: TagService,) {
    this.uploadSong = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2), Validators.maxLength(100)]),
      title: new FormControl("", [Validators.required, Validators.minLength(10), Validators.maxLength(150)]),
      subtitle: new FormControl("", [Validators.required, Validators.minLength(10)]),
      singers: new FormControl("", Validators.required),
      content: new FormControl(""),
      song: new FormControl("", Validators.required),
      image: new FormControl("", Validators.required),
      tags: new FormControl("", Validators.required),
      artists: new FormControl(""),
      job: new FormControl("")
    });
    this.getSingers();
    this.getTags();
    //this.getArtists();
    //this.getJobs();
  }
  
  ngOnInit(): void {
  }
  ngOnChanges(): void {
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

  getNameErrorMessage(): string {
    let message: string = this.getError(this.uploadSong.controls.name);
    if (message != "") return message;
  }

  getSingers(): void {
    try {
      this.singerService.getSingers().subscribe(singers => {
        this.singers = singers;
        this.sort(this.singers);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  sort(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  getErrorMessage(): string {
    let message: string = this.getError(this.uploadSong.controls.singers);
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

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.uploadSong.controls.image.setValue("for_songs/");
  }

  selectSong(fileToUpload: File): void {
    console.log(fileToUpload);
    console.log(fileToUpload.name);
    this.songFile = fileToUpload;
    // this.uploadSong.controls.song.setValue("songs/");
  }
  getTags(): void {
    try {
      this.tagService.getTagsForSongs().subscribe(tags => {
        this.tags = tags;
        this.sort(this.tags);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
