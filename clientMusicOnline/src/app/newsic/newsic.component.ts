import { Component, OnInit } from '@angular/core';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'newsic',
  templateUrl: './newsic.component.html',
  styleUrls: ['./newsic.component.css']
})
export class NewsicComponent implements OnInit {

  newSongsList: Song[] = [];

  constructor(private songService: SongService) { 
    this.songService.getSongs().subscribe(songs => {this.newSongsList = songs; this.filter();}, err => { console.log(err); });
  }

  ngOnInit() {
  }

  filter(): void {
    this.newSongsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.newSongsList = this.newSongsList.slice(0, 8);
  }

}
