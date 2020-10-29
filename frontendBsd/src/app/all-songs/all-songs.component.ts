import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongsDetailsView } from '../classes/songsDetailsView';
import { SongService } from '../services/song.service';

@Component({
  selector: 'all-songs',
  templateUrl: './all-songs.component.html',
  styleUrls: ['./all-songs.component.css']
})
export class AllSongsComponent implements OnInit {

  songsList: SongsDetailsView[] = [];
  navs: string[] = [];

  constructor(private songService: SongService) {
    try {
      this.songService.getSongs().subscribe(songs => { this.songsList = songs; }, err => console.log(err));
    }
    catch (err) { console.log(err); }
    this.navs.push("חדש במוזיקה");
  }

  ngOnInit() {
  }
  
}
