import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'now-viewed',
  templateUrl: './now-viewed.component.html',
  styleUrls: ['./now-viewed.component.css']
})
export class NowViewedComponent implements OnInit {

  songsList: Song[] = [];

  constructor(private songService: SongService) { 
    try {
    this.songService.getSongs().subscribe(song => { this.songsList = song; this.filter(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  ngOnInit() {
  }

  filter(): void {
    this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.songsList = this.songsList.slice(4, 8);
  }

}
