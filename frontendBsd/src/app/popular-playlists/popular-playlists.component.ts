import { Component, OnInit } from '@angular/core';
import { Playlists } from '../classes/playlists';
import { PlaylistsService } from '../services/playlists.service';

@Component({
  selector: 'popular-playlists',
  templateUrl: './popular-playlists.component.html',
  styleUrls: ['./popular-playlists.component.css']
})
export class PopularPlaylistsComponent implements OnInit {

  latestPlaylists: Playlists[] = [];

  constructor(private playlistService: PlaylistsService) {
    try {
      this.playlistService.getPlaylists()
        .subscribe(playlist => { this.latestPlaylists = playlist; this.filter(); },
        err => { console.log(err); });
    }
    catch (err) { console.log(err); }
   }

  ngOnInit(): void {
  }
  
  filter(): void {
    this.latestPlaylists.sort((a, b) => Math.round(b.count_views - a.count_views));
  }

}
