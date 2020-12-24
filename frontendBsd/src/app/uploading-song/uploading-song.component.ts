import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { Artist } from '../classes/artist';
import { ArtistWithJob } from '../classes/artistWithJob';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { TagsForSongs } from '../classes/tag';
import { SelectJobComponent } from '../select-job/select-job.component';
import { ArtistService } from '../services/artist.service';
import { SingerService } from '../services/singer.service';
import { SongObj, SongService } from '../services/song.service';
import { TagService } from '../services/tag.service';
import { MailDetails, UploadService } from '../services/upload.service';
import { SingersToSongService } from '../services/singers-to-song.service';
import { TagsToSongsService } from '../services/tags-to-songs.service';
import { ArtistsToSongsService } from '../services/artists-to-songs.service';
import { Job } from '../classes/job';
import { JobService } from '../services/job.service';
import { MailDetailsDialogComponent } from '../mail-details-dialog/mail-details-dialog.component';

export interface DialogData {
  mailDetails: MailDetails;
}

@Component({
  selector: 'uploading-song',
  templateUrl: './uploading-song.component.html',
  styleUrls: ['./uploading-song.component.css', './../admin-style.css']
})
export class UploadingSongComponent implements OnInit {

  uploadSong: FormGroup;
  imageFile: File;
  songFile: File;
  singers: Singer[] = [];
  tags: TagsForSongs[] = [];
  artists: Artist[] = [];
  isPerformance: boolean = false;
  artistsWithJobs: ArtistWithJob[] = [];
  jobs: Job[] = [];

  filteredSongs: Observable<Song[]>;
  songs: Song[] = [];
  songControl = new FormControl();
  SelectedSong: Song;

  isEdit: boolean = false;
  image: string;
  song: string;
  text: string;
  selectedArtist: boolean = false;
  // artistWithJob:ArtistWithJob=new ArtistWithJob;
  artist1: string = "";
  job1: string = "";

  mailDetails: MailDetails = new MailDetails();

  constructor(private singerService: SingerService, private tagService: TagService,
    private artistService: ArtistService, private uploadService: UploadService,
    public dialog: MatDialog, private songService: SongService, private _snackBar: MatSnackBar,
    private singersToSService: SingersToSongService, private tagsToSongsService: TagsToSongsService,
    private artistsToSongsService: ArtistsToSongsService, private jobService: JobService) {
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
    this.getArtists();
    this.getJobs();
    this.getSongs();
    this.songControl = new FormControl();
  }

  ngOnInit(): void {
  }

  getSongs() {
    try {
      this.songService.getSongsIncludePerformances().subscribe(songs => {
        this.songs = songs;
        this.songs.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  onSelectionChange(event): void {
    console.log(event.option.value);
    // try {
    //   this.songService.getsongbyn(event.option.value)
    //     .subscribe(playlist => {
    //       this.SelectedPlaylist = playlist;
    //       console.log(this.SelectedPlaylist);
    //       this.enteringValues();
    //     }, err => console.log(err));
    // } catch (err) { console.log(err); }
    this.songs.forEach(item => {
      if (item.name == event.option.value) {
        this.SelectedSong = item;
        this.enteringValues();
      }
    })
  }

  getJobs(): void {
    try {
      this.jobService.getJobs()
        .subscribe(jobs => {
          this.jobs = jobs;
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  onSubmit(): void {
    this.uploadSong.controls.song.setValue("songs/");
    if (this.uploadSong.valid && this.imageFile != null && this.songFile != null) {
      this.openDialogToMailDetails();
    }
  }

  addingSong(): void {
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
      // try {
      //   this.songService.addSong(songObj).subscribe(res => {
      //     console.log(res);
      //     this.openSnackBar("העלאת שיר בוצעה בהצלחה");
      //     this.saveFile([this.imageFile, this.songFile], "images//for_songs//" + folderOfSinger, "songs//" + folderOfSinger);
      //     this.reset();
      //   }, err => console.log(err));
      // } catch (err) { console.log(err); }
      try {
        this.songService.addFullSong(songObj, this.imageFile, this.songFile, this.mailDetails)
        .subscribe(result => {
          this.openSnackBar(result == true ? "העלאת השיר בוצעה בהצלחה" :
          "העלאת השיר נכשלה. נסה שוב מאוחר יותר");
          this.reset();
        }, err => console.log(err));
      } catch (err) { console.log(err); }
  }

  reset() {
    this.uploadSong.reset({ value: "" });
  }

  enteringValues(): void {
    if (this.isEdit == true && this.SelectedSong != null) {
      this.uploadSong.controls.name.setValue(this.SelectedSong.name);
      this.uploadSong.controls.title.setValue(this.SelectedSong.title);
      this.uploadSong.controls.subtitle.setValue(this.SelectedSong.subtitle);
      this.uploadSong.controls.image.setValue(this.SelectedSong.image_location);
      this.uploadSong.controls.content.setValue(this.SelectedSong.content);
      this.uploadSong.controls.song.setValue(this.SelectedSong.file_location);
      this.image = "../../assets/images/" + this.SelectedSong.image_location;
      this.song = "../../assets/songs/" + this.SelectedSong.file_location;
      this.text = "../../assets/text/" + this.SelectedSong.content;
      this.isPerformance = this.SelectedSong.isPerformance;
      try {
        this.singersToSService.getSingersToSong(this.SelectedSong.id)
          .subscribe(singers => {
            this.uploadSong.controls.singers.setValue(singers);
            console.log(singers);
          }, err => console.log(err));
      } catch (err) { console.log(err); }
      try {
        this.tagsToSongsService.getTagsNamesToSong(this.SelectedSong.id)
          .subscribe(tts => {
            this.uploadSong.controls.tags.setValue(tts);
          }, err => console.log(err));
      } catch (err) { console.log(err); }
      try {
        this.artistsToSongsService.getArtistsNamesToSong(this.SelectedSong.id)
          .subscribe(ats => {
            this.uploadSong.controls.artists.setValue(ats);
          }, err => console.log(err));
      } catch (err) { console.log(err); }
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  selectJob(job: string): void {
    if (this.selectedArtist) {
      let awj: ArtistWithJob = new ArtistWithJob;
      awj.artistName = this.artist1;
      awj.jobName = job;
      this.artistsWithJobs.push(awj);
      this.selectedArtist = false;
      this.uploadSong.controls.artists.setValue("");
    }
  }
  selectArtist(artist: string) {
    if (!this.selectedArtist) {
      this.artist1 = artist;
      this.selectedArtist = true;
      this.uploadSong.controls.job.setValue("");
    }

  }

  // openSelectJob(artistName: string): void {
  //   try {
  //     const dialogRef = this.dialog.open(SelectJobComponent, {
  //       width: '400px',
  //       data: { }
  //     });
  //     dialogRef.afterClosed().subscribe(result => {
  //       let awj = new ArtistWithJob();
  //       awj.artistName = artistName;
  //       awj.jobName = result;
  //       this.artistsWithJobs.push(awj);
  //     });
  //   }
  //   catch (err) { console.log(err); }
  // }

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
      this.uploadService.postFile(filesToUpload, folderName, folderName2, this.uploadSong.controls.name.value, this.mailDetails).subscribe(
        res => console.log(res),
        error => console.log(error)
      );
    }
  }

  openDialogToMailDetails(): void {
    this.mailDetails
    try {
      const dialogRef = this.dialog.open(MailDetailsDialogComponent, {
        width: '400px',
        data: { }
      });
      dialogRef.afterClosed().subscribe(result => {
        this.mailDetails = result;
        this.addingSong();
      });
    }
    catch (err) { console.log(err); return null; }
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
      this.tagService.getTagsForSongs().subscribe(tags => {
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

  public updatePlaylists(): void {
    this.filteredSongs = this.songControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterPlaylists(value))
      );
  }

  public _filterPlaylists(value: string): Song[] {
    const filterValue = value.toLowerCase();
    return this.songs.filter(song => song.name.toLowerCase().includes(filterValue));
  }

}
