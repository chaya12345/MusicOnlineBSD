import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'clips',
  templateUrl: './clips.component.html',
  styleUrls: ['./clips.component.css']
})
export class ClipsComponent implements OnInit {

  clipsList: Song[] = [];

  constructor(private songService: SongService) {
    try {
    this.songService.getSongsByTag('קליפ').subscribe(songs => { this.clipsList = songs; this.filter(); }, err => { console.log(err); });
    }
    catch { console.log('clips'); }
  }

  ngOnInit() {
  }

  filter(): void {
    this.clipsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.clipsList = this.clipsList.slice(0, 8);
  }

}
