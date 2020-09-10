import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'favorite',
  templateUrl: './favorite.component.html',
  styleUrls: ['./favorite.component.css']
})
export class FavoriteComponent implements OnInit {

  favoriteSongsList: Song[] = [];

  constructor(private songService: SongService) {
    try {
    this.songService.getSongs().subscribe(song => {this.favoriteSongsList = song; this.filter();}, err => { console.log(err); });
    }
    catch { console.log('favorite'); }
  }

  ngOnInit() {
  }

  filter(): void {
    this.favoriteSongsList.sort((a, b) => Math.round(b.count_like - a.count_like));
    this.favoriteSongsList = this.favoriteSongsList.slice(0, 5);
  }

}
