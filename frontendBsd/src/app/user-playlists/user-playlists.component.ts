import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Song } from '../classes/song';
import { User } from '../classes/user';
import { UserPlaylists } from "../classes/UserPlaylists";
import { MessageComponent } from '../message/message.component';
import { CommonMessageService } from '../services/common-message.service';
import { SongsToPlaylistsService } from '../services/songs-to-playlists.service';
import { UserPlaylistsService } from '../services/user-playlists.service';

@Component({
  selector: 'user-playlists',
  templateUrl: './user-playlists.component.html',
  styleUrls: ['./user-playlists.component.css', './../m-style.css']
})
export class UserPlaylistsComponent implements OnInit {
  [x: string]: any;

  @ViewChild('playlistSection') playlistSection: ElementRef;
  @ViewChild('rename') renameElement: ElementRef;

  @Input() user: User;
  playlists: UserPlaylists[] = [];

  draggedSong: Song = null;
  lastDraggedSong: Song = null;
  droppedPlaylist: UserPlaylists = null;

  activePlaylist: UserPlaylists;
  isMove: boolean;
  edit: boolean = false;
  rename: string;
  hasError: boolean = false;

  constructor(private userPlaylistsService: UserPlaylistsService,
    private stpService: SongsToPlaylistsService, private dialog: MatDialog,
    private _snackbar: MatSnackBar, private cmService: CommonMessageService) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.user != null) {
      this.getPlaylistsOfUser();
      this.activePlaylist = this.playlists[0];
      this.edit = false;
    }
  }

  getPlaylistsOfUser(): void {
    try {
      this.userPlaylistsService.GetPlaylistsByUserId(this.user.id)
        .subscribe(plylsts => { this.playlists = plylsts; this.activePlaylist = null; }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  scrollToSection(): void {
    this.playlistSection.nativeElement.scrollIntoView({ behavior: 'smooth' });
  }

  dragSong(song: Song): void {
    this.draggedSong = song;
    if (song != null) {
      this.lastDraggedSong = song;
    }
    else if (this.isMove == true) {
      this.moveSong(this.droppedPlaylist);
    }
  }

  moveSong(playlist: UserPlaylists): void {
    if (this.draggedSong != null) {
      this.droppedPlaylist = playlist;
    }
    else if (this.droppedPlaylist == playlist) {
      this.openMessageDialog("האם אתה בטוח שברצונך להעביר את השיר \'" + this.lastDraggedSong.name +
        "\' מפלייליסט \'" + this.activePlaylist.name.trim() + "\' ל\'" + playlist.name.trim() + "\'?",
        this.lastDraggedSong, this.activePlaylist, this.droppedPlaylist);
    }
  }

  openMessageDialog(text: string, song: Song, prevPlaylist: UserPlaylists, currPlaylist: UserPlaylists) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true) {
          try {
            this.stpService.moveSongToOtherPlaylist(song.id, prevPlaylist.id, currPlaylist.id)
              .subscribe(res => {
                this.openSnackBar(res == true ? this.cmService.MOVE_SONG.SUCCESS : this.cmService.MOVE_SONG.FAIL);
                this.activePlaylist = null;
              }, () => this.openSnackBar(this.cmService.MOVE_SONG.ERROR));
          } catch { this.openSnackBar(this.cmService.MOVE_SONG.ERROR); }
        }
      });
    } catch (err) { console.log(err); }
  }

  private openSnackBar(message: string) {
    this._snackbar.open(message, '', {
      duration: 2000
    });
  }
  openDeleteMessageDialog(text: string, playlistId: number) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true) {
          try {
            this.userPlaylistsService.deleteUserPlaylist(playlistId).subscribe(
              () => {
                this.getPlaylistsOfUser();
                this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS);
              }
              , () => this.openSnackBar(this.cmService.DELETE_ITEM.FAIL))
          }
          catch { this.openSnackBar(this.cmService.DELETE_ITEM.ERROR); }
        }
      });
    } catch (err) { console.log(err); }
  }

  Remane(event: any, playlistId: number) {
    try {
      let playlist: string = event.target.value;
      if (playlist.length > 2) {
        this.userPlaylistsService.playlistRename(playlist, playlistId).subscribe(
          suc => {
            this.edit = false;
            this.playlists.forEach(element => {
              if (element.id == playlistId)
                element.name = playlist;
            });
            this.cmService.RENAME_PLAYLIST.SUCCESS
          }, err => this.cmService.RENAME_PLAYLIST.ERROR);
      }
      else
        this.hasError = true
    } catch (err) { this.cmService.RENAME_PLAYLIST.ERROR }

  }
  ToRename() {
    this.edit = true;
    // this.ranameElement.nativeElement.focus();
    const input: HTMLInputElement = this.ranameElement.nativeElement as HTMLInputElement;
    input.focus();
    input.select();
  }
  clicPlaylist(playlist: UserPlaylists) {
    if (this.activePlaylist != playlist) {
      this.activePlaylist = playlist;
      this.edit = false;
      this.hasError = false;
      this.scrollToSection();
    }

  }
}
