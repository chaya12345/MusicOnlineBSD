import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'song-in-playlist',
  templateUrl: './song-in-playlist.component.html',
  styleUrls: ['./song-in-playlist.component.css']
})
export class SongInPlaylistComponent implements OnInit {

  @Input() song: Song;
  isPlay: boolean = false;
  checked: boolean = true;

  constructor() { }

  ngOnInit() {
  }

  play(): void {
    this.isPlay = true;
  }

  pause(): void {
    this.isPlay = false;
  }

}
