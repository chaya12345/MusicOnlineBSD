import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { AudioPlaying } from '../classes/audioPlaying';
import { PlayList } from '../classes/playlist';
import { Song } from '../classes/song';
import { PlaylistsService } from '../services/playlists.service';
import { SongsToPlaylistsService } from '../services/songs-to-playlists.service';

export class SongsToPlaylistObj {
  id: number;
  songs: Song[] = [];
}

@Component({
  selector: 'priv-main',
  templateUrl: './priv-main.component.html',
  styleUrls: ['./priv-main.component.css']
})
export class PrivMainComponent implements OnInit {

  playlists: PlayList[] = [];
  stpObj: SongsToPlaylistObj[] = [];
  @Output() sendPlaylist: EventEmitter<Song[]> = new EventEmitter();
  @Output() onPlay: EventEmitter<AudioPlaying> = new EventEmitter();

  constructor(private playlistsService: PlaylistsService, private songsToPlaylistService: SongsToPlaylistsService) {
    this.getPlaylists();
  }

  ngOnInit(): void {
  }

  getPlaylists(): void {
    try {
      this.playlistsService.GetPlaylistsByUserId(10).subscribe(playlists => {
        this.playlists = playlists;
        this.playlists.forEach(element => {
          this.getSongsToPlaylist(element.id);
        });
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getSongsToPlaylist(playlistId: number): void {
    try {
      this.songsToPlaylistService.getSongsToPlaylists(playlistId).subscribe(result => {
        let stp = new SongsToPlaylistObj();
        stp.id = playlistId;
        stp.songs = result;
        this.stpObj.push(stp);
        console.log(this.stpObj);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  h(playlist) {
    console.log(this.stpObj[this.playlists.indexOf(playlist)].songs);
  }
  sentPlayList(obj: AudioPlaying) {
    //this.onPlay.emit(obj);
  }
  movePlaylist(songList: Song[]) {
    this.sendPlaylist.emit(songList);
  }

}
