import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Song } from '../classes/song';
import { SongSelection } from '../classes/songSelection';

@Component({
  selector: 'an-sr-song',
  templateUrl: './an-sr-song.component.html',
  styleUrls: ['./an-sr-song.component.css']
})
export class AnSrSongComponent implements OnInit {

  @Input() song: Song;
  @Input() possible: number;
  @Output() selectedSong: EventEmitter<SongSelection> = new EventEmitter<SongSelection>();
  selected: boolean = false;
  focus: boolean = false;
  maxCount: number = 10;

  constructor() { }

  ngOnInit(): void {
  }

  addSong(): void {
    this.selected = !this.selected;
    let state: SongSelection = new SongSelection();
    state.song = this.song;
    state.select = this.selected;
    this.selectedSong.emit(state);
    if (this.possible > 0) {
      this.focus = false;
    }
    else {
      this.selected = !this.selected;
    }
  }

}
