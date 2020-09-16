import { Component, Input, OnInit } from '@angular/core';
import { PlaylistSystem } from '../classes/playlistSystem';

@Component({
  selector: 'popular-playlist',
  templateUrl: './popular-playlist.component.html',
  styleUrls: ['./popular-playlist.component.css']
})
export class PopularPlaylistComponent implements OnInit {

  @Input() playlist: PlaylistSystem;

  constructor() {
   }

  ngOnInit() {
  }

}
