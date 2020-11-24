import { Component, OnInit } from '@angular/core';
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
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  h(playlist){
    console.log(this.stpObj[this.playlists.indexOf(playlist)]);
  }

}
