import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'm-clips',
  templateUrl: './m-clips.component.html',
  styleUrls: ['./m-clips.component.css', './../m-style.css']
})
export class MClipsComponent implements OnInit {

  clips: Song[] = [];

  constructor(private songService: SongService) {
    this.getLatestClip();
  }

  ngOnInit(): void {
  }

  getLatestClip(): void {
    try {
      this.songService.getSongsByTag("קליפ").subscribe(clips => {
        this.clips = clips;
        this.clips.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.clips = this.clips.slice(0, 8);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
