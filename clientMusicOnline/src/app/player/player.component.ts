import { Component, OnInit, Input } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'player',
  templateUrl: './player.component.html',
  styleUrls: ['./player.component.css']
})
export class PlayerComponent implements OnInit {

  @Input() song: Song;

  msbapAudioUrl;
  msbapTitle;
  msbapDisplayTitle;
  msbapDisplayVolumeControls;
  msbapDisablePositionSlider;

  constructor() { }

  ngOnInit() {
    this.msbapAudioUrl = '../../assets/songs/' + this.song.file_location;
    this.msbapTitle = this.song.title;
    this.msbapDisplayTitle = false;
    this.msbapDisplayVolumeControls = true;
    this.msbapDisablePositionSlider = true;
  }

}
