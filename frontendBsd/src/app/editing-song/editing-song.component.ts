import { HttpClient } from '@angular/common/http';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar, MatDialog } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { CustomArtist } from '../adding-a-song/adding-a-song.component';
import { Artist } from '../classes/artist';
import { ArtistWithJob } from '../classes/artistWithJob';
import { Job } from '../classes/job';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { TagsForSongs } from '../classes/tag';
import { MailDetailsDialogComponent } from '../mail-details-dialog/mail-details-dialog.component';
import { ArtistService } from '../services/artist.service';
import { ArtistsToSongsService } from '../services/artists-to-songs.service';
import { CommonMessageService } from '../services/common-message.service';
import { JobService } from '../services/job.service';
import { SingerService } from '../services/singer.service';
import { SingersToSongService } from '../services/singers-to-song.service';
import { SongObj, SongService } from '../services/song.service';
import { TagService } from '../services/tag.service';
import { TagsToSongsService } from '../services/tags-to-songs.service';
import { MailDetails } from '../services/upload.service';

@Component({
  selector: 'editing-song',
  templateUrl: './editing-song.component.html',
  styleUrls: ['./editing-song.component.css', './../admin-style.css']
})
export class EditingSongComponent implements OnInit {

  @ViewChild("autoSingers") autoSingers: ElementRef;
  singersList: Singer[] = [];
  filteredSingers: Observable<Singer[]>;
  selectedSingers: Singer[] = [];

  @ViewChild("autoArtists") autoArtists: ElementRef;
  artistsList: Artist[];
  filteredArtists: Observable<Artist[]>;
  selectedArtists: CustomArtist[] = [];

  @ViewChild("autoJobs") autoJobs: ElementRef;
  filteredJobs: Observable<Job[]>;
  jobsList: Job[] = [];

  @ViewChild("autoTags") autoTags: ElementRef;
  filteredTags: Observable<TagsForSongs[]>;
  tagsList: TagsForSongs[] = [];
  selectedTags: TagsForSongs[] = [];


  @ViewChild("autoSongs") autoSongs: ElementRef;
  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  SelectedSong: Song;
  songFormGroup: FormGroup;

  detailsFormGroup: FormGroup;
  filesFormGroup: FormGroup;
  artistsFormGroup: FormGroup;
  tagFormGroup: FormGroup;
  contentFormGroup: FormGroup;

  songFile: File;
  imageFile: File;
  mailDetails: MailDetails;

  song: string;
  image: string;
  text: string = "";

  constructor(private singerService: SingerService, private _snackBar: MatSnackBar,
    private artistService: ArtistService, private jobService: JobService,
    private tagService: TagService, private songService: SongService,
    private dialog: MatDialog, private cmService: CommonMessageService,
    private tagsToSongService: TagsToSongsService, private singersToSongService: SingersToSongService,
    private artistsToSongService: ArtistsToSongsService, private httpClient: HttpClient) {
    this.songFormGroup = new FormGroup({
      song: new FormControl("", Validators.required)
    });
    this.detailsFormGroup = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2)]),
      title: new FormControl("", [Validators.required, Validators.minLength(3)]),
      subtitle: new FormControl("", [Validators.required, Validators.minLength(6)]),
      isPerformance: new FormControl(false),
    });
    this.filesFormGroup = new FormGroup({
      song: new FormControl("", Validators.required),
      image: new FormControl("", Validators.required)
    });
    this.artistsFormGroup = new FormGroup({
      singer: new FormControl(""),
      singers: new FormControl("", [Validators.required, Validators.minLength(1)]),
      artist: new FormControl(""),
      artists: new FormControl(""),
      job: new FormControl("")
    });
    this.tagFormGroup = new FormGroup({
      tag: new FormControl(""),
      tags: new FormControl("", [Validators.required, Validators.minLength(1)])
    });
    this.contentFormGroup = new FormGroup({
      text: new FormControl("")
    });
    this.getSongs();
    this.getSingers();
    this.getArtists();
    this.getJobs();
    this.getTags();
  }

  ngOnInit(): void {
  }

  confirm(): void {
    try {
      let songObj = new SongObj();
      let song = new Song();
      song.id = this.SelectedSong.id;
      song.name = this.detailsFormGroup.controls.name.value;
      song.title = this.detailsFormGroup.controls.title.value;
      song.subtitle = this.detailsFormGroup.controls.subtitle.value;

      let folder = this.formatToFolderName(this.selectedSingers[0].name);
      if (this.songFile != undefined && this.songFile != null) {
      song.type = this.songFile.type.includes("video") ? "video" : "audio";
      song.file_location = folder + "\\" + this.songFile.name;
      }
      else {
        song.file_location = this.SelectedSong.file_location;
      }
      if (this.imageFile != undefined && this.imageFile != null) {
        song.image_location = "for_songs/" + folder + "/" + this.imageFile.name;
      }
      else {
        song.image_location = this.SelectedSong.image_location;
      }
      song.isPerformance = this.detailsFormGroup.controls.isPerformance.value;
      let content: string = (document.getElementsByClassName("custom-editor")[0] as HTMLElement).innerHTML.toString();
      song.content = "songs_content/" + folder + "/" + this.formatToFolderName(song.name);
      songObj.song = song;
      let singers: string[] = [];
      this.selectedSingers.forEach(singer => {
        singers.push(singer.name);
      });
      songObj.singers = singers;
      let artists: ArtistWithJob[] = [];
      this.selectedArtists.forEach(item => {
        let newArtist = new ArtistWithJob();
        newArtist.artistName = item.artist.name;
        newArtist.jobName = item.job.name;
        artists.push(newArtist);
      });
      songObj.artists = artists;
      let tags: string[] = [];
      this.selectedTags.forEach(tag => {
        tags.push(tag.name);
      });
      songObj.tags = tags;
      this.songService.addSong(songObj, this.imageFile, this.songFile, this.mailDetails, content.toString(), true)
        .subscribe(res => this.openSnackBar(res ? this.cmService.UPDATE_ITEM.SUCCESS :
          this.cmService.UPDATE_ITEM.ERROR));
    } catch { this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR); }
  }

  // openDialogToMailDetails(): void {
  //   try {
  //     const dialogRef = this.dialog.open(MailDetailsDialogComponent, {
  //       width: '400px', data: {}
  //     });
  //     dialogRef.afterClosed().subscribe(result => {
  //       this.mailDetails = result.mailDetails;
  //       this.confirm();
  //     });
  //   }
  //   catch (err) { console.log(err); return null; }
  // }

  formatToFolderName(singer: string): string {
    return singer.trim().split(' ').join('-');
  }

  selectSong(fileToUpload: File): void {
    this.songFile = fileToUpload;
    this.filesFormGroup.controls.song.setValue(this.songFile);
  }

  selectImage(fileToUpload: File): void {
    this.imageFile = fileToUpload;
    this.filesFormGroup.controls.image.setValue(this.imageFile);
  }

  getSongs() {
    try {
      this.songService.getSongs().subscribe(songs => {
        this.songsList = songs; this.updateSongsList();
      }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
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

  getArtists(): void {
    try {
      this.artistService.getArtists()
        .subscribe(artists => {
          this.artistsList = artists;
          this.orderByName(this.artistsList);
          this.updateArtistsList();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  getJobs(): void {
    try {
      this.jobService.getJobs()
        .subscribe(jobs => {
          this.jobsList = jobs;
          this.orderByName(this.jobsList);
          this.updateJobsList();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  getTags() {
    try {
      this.tagService.getTagsForSongs()
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

  addSinger(): void {
    let singerName = this.artistsFormGroup.controls.singer.value;
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
      this.artistsFormGroup.controls.singer.setValue("");
    }
  }

  addArtist(): void {
    let artistName = this.artistsFormGroup.controls.artist.value;
    let jobName = this.artistsFormGroup.controls.job.value;
    let newArtist = new CustomArtist();
    if (artistName != null && artistName != "" && jobName != null && jobName != "") {
      this.artistsList.forEach(artist => {
        if (artist.name == artistName) {
          newArtist.artist = artist;
        }
      });
      this.jobsList.forEach(job => {
        if (job.name == jobName) {
          newArtist.job = job;
        }
      });
      this.selectedArtists.push(newArtist);
    }
    this.artistsFormGroup.controls.artist.setValue("");
    this.artistsFormGroup.controls.job.setValue("");
  }

  addTag(): void {
    let tagName = this.tagFormGroup.controls.tag.value;
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
      this.tagFormGroup.controls.tag.setValue("");
    }
  }

  updateSingersControl(): void {
    this.artistsFormGroup.controls.singers.setValue(this.selectedSingers);
  }

  updateArtistsControl(): void {
    this.artistsFormGroup.controls.artists.setValue(this.selectedArtists);
  }

  updateTagsControl(): void {
    this.tagFormGroup.controls.tags.setValue(this.selectedTags);
  }

  notDuplicate(artist: any, list: any[]): boolean {
    return !list.includes(artist);
  }

  clearSinger(singer: Singer): void {
    this.selectedSingers.splice(this.selectedSingers.indexOf(singer), 1);
    this.updateSingersControl();
  }

  clearArtist(artist: CustomArtist): void {
    this.selectedArtists.splice(this.selectedArtists.indexOf(artist), 1);
    this.updateArtistsControl();
  }

  clearTag(tag: TagsForSongs): void {
    this.selectedTags.splice(this.selectedTags.indexOf(tag), 1);
    this.updateTagsControl();
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  public updateSongsList(): void {
    this.filteredSongs = this.songFormGroup.controls.song.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSongs(value))
      );
  }

  public _filterSongs(value: string): Song[] {
    const filterValue = value.toLowerCase();
    return this.songsList.filter(song => song.name.toLowerCase().includes(filterValue));
  }

  onSelectionChange(event): void {
    this.songsList.forEach(item => {
      if (item.name == event.option.value) {
        this.SelectedSong = item;
        this.fillingForm();
      }
    });
  }

  fillingForm(): void {
    this.detailsFormGroup.controls.name.setValue(this.SelectedSong.name);
    this.detailsFormGroup.controls.title.setValue(this.SelectedSong.title);
    this.detailsFormGroup.controls.subtitle.setValue(this.SelectedSong.subtitle);
    this.detailsFormGroup.controls.isPerformance.setValue(this.SelectedSong.isPerformance);
    this.contentFormGroup.controls.text.setValue(this.SelectedSong.content);
    this.filesFormGroup.controls.song.setValue(this.SelectedSong.file_location);
    this.filesFormGroup.controls.image.setValue(this.SelectedSong.image_location);
    this.song = "../../assets/songs/" + this.SelectedSong.file_location;
    this.image = "../../assets/images/" + this.SelectedSong.image_location;
    this.getContent();
    this.getTagsOfSong();
    this.getSingersOfSong();
    this.getArtistsOfSong();
  }

  getContent(): void {
    this.httpClient.get("../../assets/text/" + this.SelectedSong.content, {
      responseType: 'text'
    }).subscribe(data => { this.text = data; });
  }

  getTagsOfSong(): void {
    try {
      this.selectedTags = [];
      this.tagsToSongService.getTagsNamesToSong(this.SelectedSong.id)
        .subscribe(tags => {
          this.tagFormGroup.controls.tags.setValue(tags);
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

  getSingersOfSong(): void {
    try {
      this.selectedSingers = [];
      this.singersToSongService.getSingersToSong(this.SelectedSong.id)
        .subscribe(singers => {
          this.artistsFormGroup.controls.singers.setValue(singers);
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

  getArtistsOfSong(): void {
    try {
      this.selectedArtists = [];
      this.artistsToSongService.getArtistsToSong(this.SelectedSong.id)
        .subscribe(items => {
          items.forEach(item => {
            let artistWithJob = new CustomArtist();
            let _artist = new Artist();
            let _job = new Job();
            this.artistsList.forEach(artist => {
              if (artist.id == item.artistId) {
                _artist = artist;
              }
            });
            this.jobsList.forEach(job => {
              if (job.id == item.jobId) {
                _job = job;
              }
            });
            artistWithJob.artist = _artist;
            artistWithJob.job = _job;
            this.selectedArtists.push(artistWithJob);
          });
          this.updateArtistsControl();
        });
    } catch (err) { console.log(err); }
  }

  public updateSingersList(): void {
    this.filteredSingers = this.artistsFormGroup.controls.singer.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSingers(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.singersList.filter(singer => singer.name.toLowerCase().includes(filterValue));
  }

  public updateArtistsList(): void {
    this.filteredArtists = this.artistsFormGroup.controls.artist.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterArtists(value))
      );
  }

  public _filterArtists(value: string): Artist[] {
    const filterValue = value.toLowerCase();
    return this.artistsList.filter(artist => artist.name.toLowerCase().includes(filterValue));
  }

  public updateJobsList(): void {
    this.filteredJobs = this.artistsFormGroup.controls.job.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterJobs(value))
      );
  }

  public _filterJobs(value: string): Job[] {
    const filterValue = value.toLowerCase();
    return this.jobsList.filter(job => job.name.toLowerCase().includes(filterValue));
  }

  public updateTagsList(): void {
    this.filteredTags = this.tagFormGroup.controls.tag.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterTags(value))
      );
  }

  public _filterTags(value: string): TagsForSongs[] {
    const filterValue = value.toLowerCase();
    return this.tagsList.filter(tag => tag.name.toLowerCase().includes(filterValue));
  }

  getNameErrorMessage(): string {
    let message: string = this.getError(this.detailsFormGroup.controls.name);
    if (message != "") return message;
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
