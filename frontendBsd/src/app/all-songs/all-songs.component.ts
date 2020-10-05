import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'all-songs',
  templateUrl: './all-songs.component.html',
  styleUrls: ['./all-songs.component.css']
})
export class AllSongsComponent implements OnInit {

  songsList: Song[] = [];
  navs: string[] = [];

  constructor(private songService: SongService) {
    try {
      this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.orderByDate(); }, err => console.log(err));
    }
    catch (err) { console.log(err); }
    this.navs.push("חדש במוזיקה");
  }

  ngOnInit() {
  }

  orderByDate(): void {
    this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

}
