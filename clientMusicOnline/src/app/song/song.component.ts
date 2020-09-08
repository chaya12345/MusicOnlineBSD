import { Component, OnInit, Input, Output } from '@angular/core';
import { Song } from '../classes/song';
import { EventEmitter } from 'protractor';

@Component({
  selector: 'song',
  templateUrl: './song.component.html',
  styleUrls: ['./song.component.css']
})
export class SongComponent implements OnInit {

  @Input() song: Song;
  // @Output() openFullSong = new EventEmitter();
  isHover:boolean = false;

  constructor() { 
  }

  ngOnInit() {
  }

  toggle_hover(event) :void {
    this.isHover = !this.isHover;
  }

  raiseFullSong(): void {
    // this.openFullSong.emit(this.song.name);
  }

}
