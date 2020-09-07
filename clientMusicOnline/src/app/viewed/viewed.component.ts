import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'viewed',
  templateUrl: './viewed.component.html',
  styleUrls: ['./viewed.component.css']
})
export class ViewedComponent implements OnInit {

  viewedSongsList: Song[] = [];

  constructor(private songService: SongService) {
    this.songService.getSongs().subscribe(songs => {this.viewedSongsList = songs; this.filter();}, err => { console.log(err); });
   }

  ngOnInit() {
  }

  filter(): void {
    this.viewedSongsList.sort((a, b) => Math.round(b.count_views - a.count_views));
    this.viewedSongsList = this.viewedSongsList.slice(0, 5);
  }

}
