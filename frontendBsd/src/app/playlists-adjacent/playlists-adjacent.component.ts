import { Component, Input, OnInit } from '@angular/core';
import { PlaylistSystem } from '../classes/playlistSystem';
import { PlaylistsSystemService } from '../services/playlists-system.service';

@Component({
  selector: 'playlists-adjacent',
  templateUrl: './playlists-adjacent.component.html',
  styleUrls: ['./playlists-adjacent.component.css']
})
export class PlaylistsAdjacentComponent implements OnInit {

  @Input() currentPlaylist: PlaylistSystem;
  nextPlaylist: PlaylistSystem;
  previousPlaylist: PlaylistSystem;

  constructor(private playlistService: PlaylistsSystemService) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    console.log(this.currentPlaylist);
    if (this.currentPlaylist != undefined) this.getNextAndPreviousPlaylists();
  }

  getNextAndPreviousPlaylists(): void {
    try {
      this.playlistService.getPlaylists().subscribe(playlists => {
        let index = 0;
        playlists.forEach(playlist => { if (playlist.id == this.currentPlaylist.id) index = playlists.indexOf(playlist); });
        index + 1 < playlists.length ?
          this.nextPlaylist = playlists[index + 1] :
          this.nextPlaylist = playlists[0];
        index == 0 ?
          this.previousPlaylist = playlists[playlists.length - 1] :
          this.previousPlaylist = playlists[index - 1];
        console.log(playlists);
        console.log(this.currentPlaylist);
        console.log(this.nextPlaylist);
        console.log(this.previousPlaylist);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
