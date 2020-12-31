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
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getSingersToParade(): void {
    try {
      this.singersToParadeService.getSingersInParade()
        .subscribe(singers => {
          this.singers = singers;
          this.singers.sort((a, b) => Math.round(b.percent - a.percent));
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}