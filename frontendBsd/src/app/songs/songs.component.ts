import { ChangeDetectorRef, Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { create } from 'domain';
import { parse } from 'path';
import { FollowUp } from '../classes/followUp';
import { ItemsByParameter } from '../classes/itemsByParameter';
import { PlayList } from '../classes/playlist';
import { Song } from '../classes/song';
import { Topics } from '../classes/topics';
import { User } from '../classes/user';
import { FieldFormComponent, Type } from '../field-form/field-form.component';
import { LogInComponent } from '../log-in/log-in.component';
import { ReportingDialogComponent } from '../reporting-dialog/reporting-dialog.component';
import { FollowUpService } from '../services/follow-up.service';
import { ItemsByParameterService } from '../services/items-by-parameter.service';
import { PlaylistsService } from '../services/playlists.service';
import { SongService } from '../services/song.service';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'songs',
  templateUrl: './songs.component.html',
  styleUrls: ['./songs.component.css']
})
export class SongsComponent implements OnInit {

  title: string = "";
  subtitle: string;
  date: Date;
  img: string = "";
  icon: string = "";
  notBlur: boolean = false;

  isFollowUp: boolean = false;
  isAddToPlaylist: boolean = false;
  isSideText: boolean = false;
  isSingular: boolean = false;
  isGeneric: boolean = false;

  navs: string[] = [];
  songs: Song[] = [];
  items: ItemsByParameter[] = [];
  song: Song;
  topic: Topics;
  followUp: FollowUp = new FollowUp();
  userInfo: User;

  mail: string;
  phone: string;
  messange: string;
  songId: number;

  userPlaylists: PlayList[] = [];

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService,
    private cdr: ChangeDetectorRef, private itemsByParameterService: ItemsByParameterService,
    private topicService: TopicsService, private router: Router,
    private followUpService: FollowUpService, private _snackbar: MatSnackBar, private dialog: MatDialog,
    private playlistService: PlaylistsService) {
    this.navs.push("חדש במוזיקה");
  }

  ngOnInit() {
    if (this.activatedRoute.snapshot.queryParams.songId) {
      this.getSong(this.activatedRoute.snapshot.queryParams.songId);
    }
    else if (this.activatedRoute.snapshot.queryParams.filter) {
      this.getItemsByFilter(this.activatedRoute.snapshot.queryParams.filter);
    }
    else {
      this.getSongs();
    }
  }

  getSong(songId: number): void {
    try {
      this.songService.getSongById(songId).subscribe(song => {
        this.song = song;
        this.title = this.song.title; this.date = this.song.date;
        this.img = "../../assets/images/" + this.song.image_location;
        this.navs.push(this.title);
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    this.isSingular = true;
  }

  getItemsByFilter(filter: string): void {
    try {
      this.itemsByParameterService.getItemsByParameter(filter).subscribe(items => {
        this.items = items;
        this.cdr.detectChanges();
        this.items.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.navs.push(filter);
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    try {
      this.itemsByParameterService.getItemByName(filter).subscribe(item => {
        this.title = item.name;
        this.subtitle = "כל השירים, הקליפים, ההופעות והכתבות";
        this.img = item.image ? "../../assets/images/" + item.image : null;
        this.notBlur = true;
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    this.isSingular = false;
    this.isGeneric = true;
  }

  getSongs(): void {
    try {
      this.songService.getSongs().subscribe(songs => {
        this.songs = songs;
        this.cdr.detectChanges();
        this.songs.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    try {
      this.topicService.getTopic("חדש במוזיקה").subscribe(topic => {
        this.title = topic.title;
        this.subtitle = topic.subtitle;
        this.icon = topic.icon;
        this.notBlur = true;
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    this.isSingular = false;
    this.isGeneric = false;
  }

  openSnackBar(message: string) {
    this._snackbar.open(message, '', {
      duration: 2000
    });
  }

  addFollowUp(value: boolean): void {
    if (this.isConnected()) {
      this.userInfo = JSON.parse(sessionStorage.getItem('user'));
      if (value == true) {
        this.followUp.songId = this.song.id;
        this.followUp.userId = this.userInfo.id;
        try {
          this.followUpService.addFollowUp(this.followUp).subscribe(result => {
            result == true ? this.openSnackBar("המעקב נוסף בהצלחה") : this.openSnackBar("כבר קיים מעקב לכתובת המייל שהוזנה");
          }, err => console.log(err));
        }
        catch (err) { console.log(err); this.openSnackBar("מצטערים, קרתה תקלה. נסה שוב מאוחר יותר"); }
      }
      else {
        this.followUp.userId = this.userInfo.id;
        try {
          this.followUpService.deleteFollowUp(this.userInfo.id, this.song.id, "song").subscribe(
            result => {
              result == true ? this.openSnackBar("המעקב הוסר בהצלחה") :
                this.openSnackBar("לא קיים מעקב לכתובת המייל שהוזנה");
            }, err => console.log(err)
          );
        } catch (err) { console.log(err); this.openSnackBar("מצטערים, קרתה תקלה. נסה שוב מאוחר יותר"); }
      }
    }
    else {
      this.openLoginDialog();
    }
  }

  openLoginDialog() {
    try {
      const dialogRef = this.dialog.open(LogInComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => { });
    } catch (err) { console.log(err); }
  }

  addReport() {
    console.log("report");
    const dialogRef = this.dialog.open(ReportingDialogComponent, {
      width: "500px",
      data: { mail: this.mail, phone: this.phone, messange: this.messange }
    });
    dialogRef.componentInstance.data.songId = this.song.id + "";
    dialogRef.afterClosed().subscribe(result =>
      console.log(result));
  }

  addToPlaylist() {
    if (this.isConnected()) {
      this.userInfo = JSON.parse(sessionStorage.getItem('user'));
      try {
        this.playlistService.GetPlaylistsByUserId(this.userInfo.id).subscribe(
          result => {
            console.log(result);
            this.userPlaylists = result;
          }, err => console.log(err));
      } catch (err) { console.log(err); }
    }
  }

  createPlaylist(): void {
    if (this.isConnected()) {
      this.openMessageDialog("הכנס שם לפלייליסט");
    }
    else {
      this.openLoginDialog();
    }
  }

  isConnected(): boolean {
    if (sessionStorage.getItem('user') != null && sessionStorage.getItem('user') != undefined) {
      this.userInfo = JSON.parse(sessionStorage.getItem('user'));
      return true;
    }
    return false;
  }

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(FieldFormComponent, {
        width: '400px',
        data: { message: text, type: Type.name }
      });
      dialogRef.afterClosed().subscribe(result => {
        this.addNewPlaylist(result);
      });
    } catch (err) { console.log(err); }
  }

  addNewPlaylist(fileName: string): void {
    try {
      let playlist = new PlayList;
      playlist.name = fileName;
      playlist.userId = this.userInfo.id;
      this.playlistService.addPlaylistWithSong(playlist, this.song).subscribe(() => {
        console.log("succes");
      }, err => console.log(err));
    } catch (err) { console.log(); }
  }

}