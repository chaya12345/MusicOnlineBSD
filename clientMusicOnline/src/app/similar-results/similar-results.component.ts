import { Component, OnInit } from '@angular/core';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';

@Component({
  selector: 'similar-results',
  templateUrl: './similar-results.component.html',
  styleUrls: ['./similar-results.component.css']
})
export class SimilarResultsComponent implements OnInit {

  songsList: Song[] = [];

  constructor(private songService: SongService) {
    songService.getSongs().subscribe(song => { this.songsList = song; this.filter(); }, err => { console.log(err); });
   }

  ngOnInit() {
  }

  filter(): void {
    this.songsList.sort((a, b) => Math.round(b.count_views - a.count_views));
    this.songsList = this.songsList.slice(0, 3);
    console.log(this.songsList);
  }

}
