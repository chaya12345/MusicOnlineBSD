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
    try {
      this.songService.getSongsByTag('קליפ').subscribe(songs => { this.songsList = songs; this.filter(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }
  
  filter(): void {
    this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    // this.songsList = this.songsList.slice(0, 3);
  }

}
