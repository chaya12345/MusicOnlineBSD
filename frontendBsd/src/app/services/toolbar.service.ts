import { Injectable } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { FollowUp } from '../classes/followUp';
import { PlayList } from '../classes/playlist';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { Subscription } from '../classes/subscription';
import { User } from '../classes/user';
import { FieldFormComponent, Type } from '../field-form/field-form.component';
import { LogInComponent } from '../log-in/log-in.component';
import { ReportingDialogComponent } from '../reporting-dialog/reporting-dialog.component';
import { CommonMessageService } from './common-message.service';
import { FollowUpService } from './follow-up.service';
import { PlaylistsService } from './playlists.service';
import { SingerService } from './singer.service';
import { SongService } from './song.service';
import { SubscriptionService } from './subscription.service';

@Injectable({
  providedIn: 'root'
})
export class ToolbarService {

  user: User;

  constructor(private followUpService: FollowUpService, private _snackbar: MatSnackBar,
    private cmService: CommonMessageService, private dialog: MatDialog,
    public songService: SongService, private singerService: SingerService,
    private subscriptionService: SubscriptionService, private playlistService: PlaylistsService) { }

  public addFollowUpToSong(songId): void {
    if (this.isUserConnected()) {
      let followUp: FollowUp = new FollowUp();
      followUp.songId = songId;
      followUp.userId = this.user.id;
      try {
        this.followUpService.addFollowUp(followUp)
          .subscribe(result => {
            result == true ?
              this.openSnackBar(this.cmService.FOLLOW_UP.ADD.SUCCESS) :
              this.openSnackBar(this.cmService.FOLLOW_UP.ADD.FAIL);
          }, err => console.log(err));
      }
      catch (err) { this.openSnackBar(this.cmService.ERROR); }
    }
    else {
      this.openLoginDialog();
    }
  }

  public removeFollowUpToSong(songId: number, userId?: number): void {
    if (userId != null) {
      try {
        this.followUpService.deleteFollowUp(userId, songId, "song").subscribe(result => {
          result == true ?
            this.openSnackBar(this.cmService.FOLLOW_UP.REMOVE.SUCCESS) :
            this.openSnackBar(this.cmService.FOLLOW_UP.REMOVE.FAIL);
        }, err => console.log(err));
      } catch (err) { this.openSnackBar(this.cmService.ERROR); }
    }
    else if (this.isUserConnected()) {
      try {
        this.followUpService.deleteFollowUp(this.user.id, songId, "song")
          .subscribe(result => {
            result == true ?
              this.openSnackBar(this.cmService.FOLLOW_UP.REMOVE.SUCCESS) :
              this.openSnackBar(this.cmService.FOLLOW_UP.REMOVE.FAIL);
          }, err => console.log(err)
          );
      } catch (err) { this.openSnackBar(this.cmService.ERROR); }
    }
    else {
      this.openLoginDialog();
    }
  }

  public addReportASong(songId): void {
    const dialogRef = this.dialog.open(ReportingDialogComponent, { width: "500px" });
    dialogRef.componentInstance.data.songId = songId;
    dialogRef.afterClosed().subscribe(result => console.log(result));
  }

  public choosingASingerToSubsciption(songId: number): void {
    if (this.isUserConnected()) {
      try {
        this.songService.getSingerOfSong(songId).subscribe(singer => {
          this.openFieldFormDialog("בחר את הזמר שתרצה להתעדכן במייל על תוכן חדש שלו >>", Type.singers, singer);
        }, err => console.log(err));
      } catch (err) { console.log(err); }
    }
    else {
      this.openLoginDialog();
    }
  }

  public createPlaylist(song: Song): void {
    if (this.isUserConnected()) {
      this.openFieldFormDialog("הכנס שם לפלייליסט", Type.name, null, song);
    }
    else {
      this.openLoginDialog();
    }
  }

  public addSongToPlaylist(song: Song): void {
    // TODO
    // if (this.isUserConnected()) {
    //   try {
    //     this.playlistService.GetPlaylistsByUserId(this.user.id).subscribe(
    //       result => {
    //         console.log(result);
    //         this.userPlaylists = result;
    //       }, err => console.log(err));
    //   } catch (err) { console.log(err); }
    // }
  }

  public removeFollowUpToArticle(articleId: number, userId?: number): void {
    if (userId != null) {
      try {
        this.followUpService.deleteFollowUp(userId, articleId, "article").subscribe(result => {
          result == true ?
            this.openSnackBar(this.cmService.FOLLOW_UP.REMOVE.SUCCESS) :
            this.openSnackBar(this.cmService.FOLLOW_UP.REMOVE.FAIL);
        }, err => console.log(err));
      } catch (err) { this.openSnackBar(this.cmService.ERROR); }
    }
  }

  // PRIVATE FUNCTIONS

  private getSingerByName(singerName: string): void {
    try {
      this.singerService.GetSingerByName(singerName).subscribe(singer =>
        this.addSubscription(singer.id), err => console.log(err));
    } catch (err) { console.log(err); }
  }

  private addSubscription(singerId: number): void {
    try {
      let sub: Subscription = new Subscription();
      sub.singerId = singerId;
      sub.userId = this.user.id;
      this.subscriptionService.addSubscription(sub).subscribe(success =>
        success == true ? this.openSnackBar(this.cmService.SUBSCRIPTION.ADD.SUCCESS) :
          this.openSnackBar(this.cmService.SUBSCRIPTION.ADD.FAIL), err => {
            console.log(err);
            this.openSnackBar(this.cmService.SUBSCRIPTION.ADD.ERROR);
          });
    } catch (err) {
      console.log(err);
      this.openSnackBar(this.cmService.SUBSCRIPTION.ADD.ERROR);
    }
  }

  private openFieldFormDialog(text: string, type: Type, singer?: Singer, song?: Song) {
    try {
      const dialogRef = this.dialog.open(FieldFormComponent, {
        width: '400px',
        data: { message: text, type: type, singer: singer }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (type == Type.name) {
          this.addNewPlaylist(result, song);
        }
        else if (type == Type.singers) {
          this.getSingerByName(result);
        }
      });
    } catch (err) { console.log(err); }
  }

  private addNewPlaylist(fileName: string, song: Song): void {
    try {
      let playlist = new PlayList;
      playlist.name = fileName;
      playlist.userId = this.user.id;
      this.playlistService.addPlaylistWithSong(playlist, song).subscribe(() => {
        console.log("succes");
      }, err => console.log(err));
    } catch (err) { console.log(); }
  }

  private openLoginDialog() {
    try {
      const dialogRef = this.dialog.open(LogInComponent, { width: '400px' });
      dialogRef.afterClosed().subscribe();
    } catch (err) { console.log(err); }
  }

  private openSnackBar(message: string) {
    this._snackbar.open(message, '', {
      duration: 2000
    });
  }

  private isUserConnected(): boolean {
    if (sessionStorage.getItem('user') != null
      && sessionStorage.getItem('user') != undefined) {
      this.user = JSON.parse(sessionStorage.getItem('user'));
      return true;
    }
    return false;
  }

}
