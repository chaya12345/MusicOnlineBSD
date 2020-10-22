import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'display-songs',
  templateUrl: './display-songs.component.html',
  styleUrls: ['./display-songs.component.css']
})
export class DisplaySongsComponent implements OnInit {

  @Input() songs: Song[] = [];
  @Input() count?: number;

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.count != null && this.count != undefined) {
      this.songs = this.songs.slice(0, this.count);
    }
  }

}
