import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit, Type } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Song } from '../classes/Song';
import { SongService } from '../services/song.service';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { Subscription } from 'rxjs';
import { Singer } from '../classes/singer';
import { FieldFormComponent } from '../field-form/field-form.component';
import { LogInComponent } from '../log-in/log-in.component';
import { ReportingDialogComponent } from '../reporting-dialog/reporting-dialog.component';
import { ToolbarService } from '../services/toolbar.service';
import { UserPlaylists } from "../classes/UserPlaylists";
import { User } from '../classes/user';
import { join } from 'path';
import { UserPlaylistsService } from '../services/user-playlists.service';

@Component({
  selector: 'song-details',
  templateUrl: './song-details.component.html',
  styleUrls: ['./song-details.component.css']
})
export class SongDetailsComponent implements OnInit {

  song: Song;
  title: string;
  img: string;
  date: Date;
  navs: string[] = [];
  singer: Singer;

  similarSongs: Song[] = [];
  userPlaylists: UserPlaylists[] = [];

  /*
  public Editor = ClassicEditor;
  htmlContent;

  songId: number;
  @Input() song: Song;
  navs: string[] = [];
  songContent: string = "";
  similarSongs: Song[] = [];*/

  constructor(private songService: SongService, private activatedRoute: ActivatedRoute,
    private toolbarService: ToolbarService, private userPlaylistsService: UserPlaylistsService
    /*, private httpClient: HttpClient,
    private router: Router*/) {
    /*this.navs.push("חדש במוזיקה");*/
    try {
      let id: number = Number(this.activatedRoute.snapshot.queryParams.songId);
      songService.addViewToSong(id).subscribe();
    } catch (err) { console.log(err); }
    let songId = this.activatedRoute.snapshot.queryParams.songId;
    this.getSong(songId);
    this.getSimilarResults(songId);
    this.getUserPlaylist();
  }

  ngOnInit() {
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
  }

  toggleFollowUp(value: boolean): void {
    value == true ?
      this.toolbarService.addFollowUpToSong(this.song.id) :
      this.toolbarService.removeFollowUpToSong(this.song.id);
  }

  addReport() {
    this.toolbarService.addReportASong(this.song.id);
  }

  addToPlaylist() {
    this.toolbarService.addSongToPlaylist(this.song);
  }

  createPlaylist(): void {
    this.toolbarService.createPlaylist(this.song);
  }

  addSubscription(): void {
    this.toolbarService.choosingASingerToSubsciption(this.song.id);
  }

  getSimilarResults(songId: number): void {
    try {
      this.songService.getSimilarSongs(songId)
        .subscribe(song => {
          this.similarSongs = song;
          this.similarSongs = this.similarSongs.slice(0, 3);
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }
  getUserPlaylist(): void {
    let user: User = JSON.parse(sessionStorage.getItem('user'));
    if (user != null && user.id != null) {
      this.userPlaylistsService.GetPlaylistsByUserId(user.id).subscribe(playlist => this.userPlaylists = playlist);
    }
  }











  /*

  onRefresh() {
    this.router.routeReuseStrategy.shouldReuseRoute = function () { return false; };
    let currentUrl = this.router.url + '?';
    this.router.navigateByUrl(currentUrl)
      .then(() => {
        this.router.navigated = false;
        this.router.navigate([this.router.url]);
      });
  }

  ngOnChanges(): void {
    try {
      this.navs.push(this.song.title);
      // this.getContent();
      this.getSimilarResults();
    } catch { }
  }

  // getContent(): void {
  //   this.httpClient.get('../../assets/text/' + this.song.content, {
  //     commitType: 'text'
  //   }).subscribe(data => { this.songContent = data; });
  // }*/

}
