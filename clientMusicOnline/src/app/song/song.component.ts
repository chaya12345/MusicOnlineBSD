import { Component, OnInit, Input } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'song',
  templateUrl: './song.component.html',
  styleUrls: ['./song.component.css']
})
export class SongComponent implements OnInit {

  @Input() song: Song;
  isHover:boolean = false;

  constructor() { }

  ngOnInit() {
  }

  toggle_hover(event) :void {
    this.isHover = !this.isHover;
  }

}
