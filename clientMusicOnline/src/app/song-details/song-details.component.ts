import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'song-details',
  templateUrl: './song-details.component.html',
  styleUrls: ['./song-details.component.css']
})
export class SongDetailsComponent implements OnInit {

  @Input() song: Song;
  songSrc: string;
  video: HTMLVideoElement;
  msbapAudioUrl: string;
  msbapTitle: string;
  msbapDisplayTitle: boolean;
  msbapDisplayVolumeControls: boolean;
  msbapDisablePositionSlider: boolean;
  songContent: any;

  constructor(public httpClient: HttpClient) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    this.getContent();
    this.getSrc();
  }

  getContent(): void {
    this.httpClient.get('../../assets/text/' + this.song.content, {
      responseType: 'text', headers: {
        "Accept": "application/txt;charset=utf-8",
        "Accept-Charset": "charset=utf-8"
      }
    }).subscribe(data => { this.songContent = data; });
  }

  getSrc(): void {
    this.songSrc = '../../assets/songs/' + this.song.file_location;
    this.video = document.querySelector('video');
    this.video.load();

    /*--- audio ---*/
    this.msbapAudioUrl = '../../assets/songs/' + this.song.file_location;
    this.msbapTitle = this.song.title;
    this.msbapDisplayTitle = false;
    this.msbapDisplayVolumeControls = true;
    this.msbapDisablePositionSlider = true;
  }

}
