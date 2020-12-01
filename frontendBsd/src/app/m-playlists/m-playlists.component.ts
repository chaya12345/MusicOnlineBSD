import { Component, OnInit } from '@angular/core';
import { PlaylistSystem } from '../classes/playlistSystem';
import { PlaylistsSystemService } from '../services/playlists-system.service';

@Component({
  selector: 'm-playlists',
  templateUrl: './m-playlists.component.html',
  styleUrls: ['./m-playlists.component.css', './../m-style.css']
})
export class MPlaylistsComponent implements OnInit {

  playlists: PlaylistSystem[] = [];

  constructor(private playlistService: PlaylistsSystemService) { 
    this.getPlaylists();
  }

  ngOnInit(): void {
  }

  getPlaylists(): void {
    try {
      this.playlistService.getPlaylists().subscribe(playlists => {
        this.playlists = playlists;
        this.playlists.sort((a, b) => b.count_views - a.count_views);
        this.playlists = this.playlists.slice(0, 8);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
