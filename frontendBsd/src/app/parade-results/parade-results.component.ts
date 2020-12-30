import { Component, OnInit } from '@angular/core';
import { ItemsToParade } from '../classes/itemsToParade';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { SongsToParadeService } from '../services/songs-to-parade.service';

@Component({
  selector: 'parade-results',
  templateUrl: './parade-results.component.html',
  styleUrls: ['./parade-results.component.css']
})
export class ParadeResultsComponent implements OnInit {

  songs: ItemsToParade[] = [];

  constructor(private songsToParadeService: SongsToParadeService) {
    this.getSongsToParade();
   }

  ngOnInit(): void {
  }

  getSongsToParade(): void {
    try {
      this.songsToParadeService.getSongsInParade()
        .subscribe(songs => {
          console.log(songs);
          this.songs = songs;
          this.songs.sort((a, b) => Math.round(b.count - a.count));
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}