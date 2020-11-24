import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Artist } from '../classes/artist';
import { ArtistWithJob } from '../classes/artistWithJob';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { Tag } from '../classes/tag';
import { SelectJobComponent } from '../select-job/select-job.component';
import { ArtistService } from '../services/artist.service';
import { SingerService } from '../services/singer.service';
import { SongObj, SongService } from '../services/song.service';
import { TagService } from '../services/tag.service';
import { UploadService } from '../services/upload.service';

@Component({
  selector: 'uploading-song',
  templateUrl: './uploading-song.component.html',
  styleUrls: ['./uploading-song.component.css']
})
export class UploadingSongComponent implements OnInit {

  uploadSong: FormGroup;
  imageFile: File;
  songFile: File;
  singers: Singer[] = [];
  tags: Tag[] = [];
  artists: Artist[] = [];
  isPerformance: boolean = false;
  artistsWithJobs: ArtistWithJob[] = [];

  constructor(private singerService: SingerService, private tagService: TagService,
    private artistService: ArtistService, private uploadService: UploadService,
    public dialog: MatDialog, private songService: SongService, private _snackBar: MatSnackBar) {
    this.uploadSong = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2), Validators.maxLength(100)]),
      title: new FormControl("", [Validators.required, Validators.minLength(10), Validators.maxLength(150)]),
      subtitle: new FormControl("", [Validators.required, Validators.minLength(10)]),
      singers: new FormControl("", Validators.required),
      song: new FormControl("", Validators.required),
      image: new FormControl("", Validators.required),
      tags: new FormControl("", Validators.required),
      artists: new FormControl("", Validators.required)
    });
    this.getSingers();
    this.getTags();
    this.getArtists();
  }

  ngOnInit(): void {
    console.log(">>" + this.convertToFolderName("אברהם פריד") + "<<");
    console.log(">>" + this.convertToFolderName("מרדכי בן דוד") + "<<");
    console.log(">>" + this.convertToFolderName("מרדכי בן דוד ") + "<<");
  }

  onSubmit(): void {
    this.uploadSong.controls.song.setValue("songs/");
    if (this.uploadSong.valid && this.imageFile != null && this.songFile != null) {
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
      try {
        this.songService.addSong(songObj).subscribe(res => {
          console.log(res);
          this.openSnackBar("העלאת שיר בוצעה בהצלחה");
          this.saveFile([this.imageFile, this.songFile], "images//for_songs//" + folderOfSinger, "songs//" + folderOfSinger);
        }, err => console.log(err));
      } catch (err) { console.log(err); }
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  selectJob(artist: string, value: boolean): void {
    if (value) {
      this.openSelectJob(artist);
    }
    else {
      this.artistsWithJobs.forEach(obj => {
        if (obj.artistName == artist) {
          let index = this.artistsWithJobs.indexOf(obj);
          this.artistsWithJobs.splice(index, 1);
        }
      });
    }
  }
  

  openSelectJob(artistName: string): void {
    try {
      const dialogRef = this.dialog.open(SelectJobComponent, {
        width: '400px',
        data: { }
      });
      dialogRef.afterClosed().subscribe(result => {
        let awj = new ArtistWithJob();
        awj.artistName = artistName;
        awj.jobName = result;
        this.artistsWithJobs.push(awj);
      });
    }
    catch (err) { console.log(err); }
  }

  convertToFolderName(singer: string): string {
    return singer.trim().split(' ').join('-');
  }

  selectSong(fileToUpload: File): void {
    console.log(fileToUpload);
    console.log(fileToUpload.name);
    this.songFile = fileToUpload;
    // this.uploadSong.controls.song.setValue("songs/");
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.uploadSong.controls.image.setValue("for_songs/");
  }

  saveFile(filesToUpload: File[], folderName: string, folderName2?: string): void {
    if (filesToUpload != null) {
      this.uploadService.postFile(filesToUpload, folderName, folderName2).subscribe(
        res => console.log(res),
        error => console.log(error)
      );
    }
  }

  getSingers(): void {
    try {
      this.singerService.getSingers().subscribe(singers => {
        this.singers = singers;
        this.sort(this.singers);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getTags(): void {
    try {
      this.tagService.getTags().subscribe(tags => {
        this.tags = tags;
        this.sort(this.tags);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getArtists(): void {
    try {
      this.artistService.getArtists().subscribe(artists => {
        this.artists = artists;
        this.sort(this.artists);
      }, err => console.log(err));
    } catch (err) { console.log(err) }
  }

  sort(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
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
