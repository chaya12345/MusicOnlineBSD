import { Component, OnInit } from '@angular/core';
import { ItemsToParade } from '../classes/itemsToParade';
import { SingersToParadeService } from '../services/singers-to-parade.service';
import { SongsToParadeService } from '../services/songs-to-parade.service';

@Component({
  selector: 'parade-results',
  templateUrl: './parade-results.component.html',
  styleUrls: ['./parade-results.component.css']
})
export class ParadeResultsComponent implements OnInit {

  songs: ItemsToParade[] = [];
  singers: ItemsToParade[] = [];
  currentItem: ItemsToParade;

  yearSong: ItemsToParade;
  followingSongs: ItemsToParade[] = [];
  restSongs: ItemsToParade[] = [];

  yearSinger: ItemsToParade;
  followingSingers: ItemsToParade[] = [];
  restSingers: ItemsToParade[] = [];

  constructor(private songsToParadeService: SongsToParadeService,
    private singersToParadeService: SingersToParadeService) {
    this.getSongsToParade();
    this.getSingersToParade();
  }

  ngOnInit(): void {
  }

  getSongsToParade(): void {
    try {
      this.songsToParadeService.getSongsInParade()
        .subscribe(songs => {
          this.songs = songs;
          this.songs.sort((a, b) => Math.round(b.percent - a.percent));
          this.songs = this.songs.slice(0, 30);
          for (let i = 0; i < this.songs.length; i++) {
            const song = this.songs[i];
            switch (i) {
              case 0:
                this.yearSong = song;
                break;
              case 1:
                this.followingSongs.push(song);
                break;
              case 2:
                this.followingSongs.push(song);
                break;
              default:
                this.restSongs.push(song);
                break;
            }
          }
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getSingersToParade(): void {
    try {
      this.singersToParadeService.getSingersInParade()
        .subscribe(singers => {
          this.singers = singers;
          this.singers.sort((a, b) => Math.round(b.percent - a.percent));
          for (let i = 0; i < this.singers.length; i++) {
            const singer = this.singers[i];
            switch (i) {
              case 0:
                this.yearSinger = singer;
                break;
              case 1:
                this.followingSingers.push(singer);
                break;
              case 2:
                this.followingSingers.push(singer);
                break;
              default:
                this.restSingers.push(singer);
                break;
            }
          }
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}