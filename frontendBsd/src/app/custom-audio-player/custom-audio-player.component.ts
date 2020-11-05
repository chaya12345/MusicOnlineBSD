import { Component, Input, OnInit } from '@angular/core';
import { AudioPlaying } from '../classes/audioPlaying';
import { Song } from '../classes/song';

@Component({
  selector: 'custom-audio-player',
  templateUrl: './custom-audio-player.component.html',
  styleUrls: ['./custom-audio-player.component.css']
})
export class CustomAudioPlayerComponent implements OnInit {

  @Input() songsList: Song[] = [];
  @Input() playingObj?: AudioPlaying;

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
  }
}
