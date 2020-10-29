import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'latest-clips',
  templateUrl: './latest-clips.component.html',
  styleUrls: ['./latest-clips.component.css']
})
export class LatestClipsComponent implements OnInit {

  songsList: Song[] = [];

  constructor(private songService: SongService) {
    this.getClips();
  }

  ngOnInit(): void {
  }

  getClips(): void {
    try {
      this.songService.getSongsByTag('קליפ').subscribe(songs => { this.songsList = songs; this.filter(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }
  
  filter(): void {
    this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

}
