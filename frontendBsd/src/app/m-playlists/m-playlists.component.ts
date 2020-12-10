import { Component, OnInit } from '@angular/core';
import { Playlists } from '../classes/playlists';
import { PlaylistsService } from '../services/playlists.service';

@Component({
  selector: 'm-playlists',
  templateUrl: './m-playlists.component.html',
  styleUrls: ['./m-playlists.component.css', './../m-style.css']
})
export class MPlaylistsComponent implements OnInit {

  playlists: Playlists[] = [];

  constructor(private playlistService: PlaylistsService) { 
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
