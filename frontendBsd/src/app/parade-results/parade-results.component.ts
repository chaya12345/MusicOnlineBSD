import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { SongsToParadeService } from '../services/songs-to-parade.service';

@Component({
  selector: 'parade-results',
  templateUrl: './parade-results.component.html',
  styleUrls: ['./parade-results.component.css']
})
export class ParadeResultsComponent implements OnInit {

  songs: Song[] = [];

  constructor(private songsToParadeService: SongsToParadeService) { }

  ngOnInit(): void {
  }

  getSongsToParade(): void {
    this.songsToParadeService.getSongsToParade()
    .subscribe(songs => {
      // this.songs = songs;
      // this.songs.sort((a, b) => Math.round(b.))
    })
  }

}