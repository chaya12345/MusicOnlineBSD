import { Component, OnInit } from '@angular/core';
import { PlaylistSystem } from '../classes/playlistSystem';
import { PlaylistsSystemService } from '../services/playlists-system.service';

@Component({
  selector: 'popular-playlists',
  templateUrl: './popular-playlists.component.html',
  styleUrls: ['./popular-playlists.component.css']
})
export class PopularPlaylistsComponent implements OnInit {

  latestPlaylists: PlaylistSystem[] = [];

  constructor(private playlistSystemService: PlaylistsSystemService) {
    try {
      this.playlistSystemService.getPlaylists()
      .subscribe(playlist => { this.latestPlaylists = playlist; this.filter(); }, err => { console.log(err); });
    }
    catch { console.log('playlist'); }
   }

  ngOnInit(): void {
  }
  
  filter(): void {
    this.latestPlaylists.sort((a, b) => Math.round(b.count_views - a.count_views));
    this.latestPlaylists = this.latestPlaylists.slice(0, 3);
  }

}
