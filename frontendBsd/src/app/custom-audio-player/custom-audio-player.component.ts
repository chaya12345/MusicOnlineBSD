import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'custom-audio-player',
  templateUrl: './custom-audio-player.component.html',
  styleUrls: ['./custom-audio-player.component.css']
})
export class CustomAudioPlayerComponent implements OnInit {

  @Input() songsList: Song[] = [];

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
  }
}
