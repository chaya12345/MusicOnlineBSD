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

  @ViewChild('playlistSection') playlistSection: ElementRef;
  @Input() user: User;
  playlists: UserPlaylists[] = [];

  draggedSong: Song = null;
  lastDraggedSong: Song = null;
  droppedPlaylist: UserPlaylists = null;

  activePlaylist: UserPlaylists;
  isMove: boolean;

  constructor(private userPlaylistsService: UserPlaylistsService,
    private stpService: SongsToPlaylistsService, private dialog: MatDialog,
    private _snackbar: MatSnackBar, private cmService: CommonMessageService,private songsToPlaylistsService:SongsToPlaylistsService) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.user != null) {
      this.getPlaylistsOfUser();
      this.activePlaylist = this.playlists[0];
    }
  }

  getPlaylistsOfUser(): void {
    try {
      this.userPlaylistsService.GetPlaylistsByUserId(this.user.id)
        .subscribe(plylsts => this.playlists = plylsts, err => console.log(err));
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
                if(res == true){

                }
                this.openSnackBar(res == true ? this.cmService.MOVE_SONG.SUCCESS : this.cmService.MOVE_SONG.FAIL);
                this.activePlaylist = null;
              }, err => this.openSnackBar(this.cmService.MOVE_SONG.ERROR));
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

}
