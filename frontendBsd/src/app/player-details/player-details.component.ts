import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'player-details',
  templateUrl: './player-details.component.html',
  styleUrls: ['./player-details.component.css']
})
export class PlayerDetailsComponent implements OnInit {

  @Input() song: Song;

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    console.log("this.song");
    console.log(this.song);
  }

}
