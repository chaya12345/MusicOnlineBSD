import { EventEmitter } from '@angular/core';
import { Component, Input, OnInit, Output } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material';
import { Artist } from '../classes/artist';
import { ArtistWithJob } from '../classes/artistWithJob';
import { Job } from '../classes/job';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { TagsForSongs } from '../classes/tag';
import { SingerService } from '../services/singer.service';
import { SingersToSongService } from '../services/singers-to-song.service';
import { SongObj, SongService } from '../services/song.service';
import { TagService } from '../services/tag.service';
import { TagsToSongsService } from '../services/tags-to-songs.service';
import { MailDetails } from '../services/upload.service';

export class SongObjWithFiles {
  songObj: SongObj;
  imageFile: File;
  songFile: File;
}

@Component({
  selector: 'song-form',
  templateUrl: './song-form.component.html',
  styleUrls: ['./song-form.component.css', './../admin-style.css']
})
export class SongFormComponent implements OnInit {

  @Input() selectedSong: Song;
  @Output() onSendSongObj: EventEmitter<SongObjWithFiles> = new EventEmitter<SongObjWithFiles>();

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

  image: string;
  song: string;

  constructor(private songService: SongService, private singerService: SingerService, private tagService: TagService,
    public dialog: MatDialog, private singersToSService: SingersToSongService, private tagsToSongsService: TagsToSongsService) {
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
    //  if (this.song != null || undefined)
  }
  enteringValues(): void {
    this.uploadSong.controls.name.setValue(this.selectedSong.name);
    this.uploadSong.controls.title.setValue(this.selectedSong.title);
    this.uploadSong.controls.subtitle.setValue(this.selectedSong.subtitle);
    this.uploadSong.controls.image.setValue(this.selectedSong.image_location);
    this.uploadSong.controls.content.setValue(this.selectedSong.content);
    this.uploadSong.controls.song.setValue(this.selectedSong.file_location);
    this.image = "../../assets/images/" + this.selectedSong.image_location;
    this.song = "../../assets/songs/" + this.selectedSong.file_location;
    this.text = "../../assets/text/" + this.selectedSong.content;
    this.isPerformance = this.selectedSong.isPerformance;
    try {
      this.singersToSService.getSingersToSong(this.selectedSong.id)
        .subscribe(singers => {
          this.uploadSong.controls.singers.setValue(singers);
          console.log(singers);
        }, err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.tagsToSongsService.getTagsNamesToSong(this.selectedSong.id)
        .subscribe(tts => {
          this.uploadSong.controls.tags.setValue(tts);
        }, err => console.log(err));
    } catch (err) { console.log(err); }
    // try {
    //   this.artistsToSongsService.getArtistsNamesToSong(this.selectedSong.id)
    //     .subscribe(ats => {
    //       this.uploadSong.controls.artists.setValue(ats);
    //     }, err => console.log(err));
    // } catch (err) { console.log(err); }
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

  onSubmit(): void {
    this.uploadSong.controls.song.setValue("songs/");
    if (this.uploadSong.valid && this.imageFile != null && this.songFile != null) {
      this.sendingSong();
    }
  }

  sendingSong(): void {
    let folderOfSinger = this.convertToFolderName(this.uploadSong.controls.singers.value[0]);
    this.uploadSong.controls.image.setValue("for_songs/" + folderOfSinger + "/" + this.imageFile.name);
    this.uploadSong.controls.song.setValue(folderOfSinger + "\\" + this.songFile.name);
    let song: Song = new Song;
    song.name = this.uploadSong.controls.name.value;
    song.type = null;
    song.title = this.uploadSong.controls.title.value;
    song.subtitle = this.uploadSong.controls.subtitle.value;
    song.image_location = null;
    song.content = null;
    song.isPerformance = this.isPerformance;
    song.file_location = this.uploadSong.controls.song.value;
    song.image_location = this.uploadSong.controls.image.value;
    song.type = this.songFile.name.slice(this.songFile.name.lastIndexOf(".") + 1, this.songFile.name.length) == "mp3" ? "audio" : "video";
    let songObj: SongObj = new SongObj();
    songObj.song = song;
    songObj.singers = this.uploadSong.controls.singers.value;
    songObj.tags = this.uploadSong.controls.tags.value;
    songObj.artists = this.artistsWithJobs;
    let sendSong: SongObjWithFiles = new SongObjWithFiles();
    sendSong.songObj = songObj;
    sendSong.imageFile = this.imageFile;
    sendSong.songFile = this.songFile;
    this.onSendSongObj.emit(sendSong);
    this.reset();
  }
  convertToFolderName(singer: string): string {
    return singer.trim().split(' ').join('-');
  }
  reset() {
    this.uploadSong.reset({ value: "" });
  }

}
