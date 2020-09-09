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
  tempList: Song[] = [];

  constructor(private songService: SongService) {
    // this.songService.GetSongsByTag("קליפ").subscribe(songs => {this.clipsList = songs; this.filter();}, err => { console.log(err); });
    this.songService.getSongs().subscribe(songs => { this.tempList = songs; this.filter(); }, err => { console.log(err); });
  }

  ngOnInit() {
  }

  filter(): void {
    this.tempList.forEach(song => {
      if (song.type == "video")
        this.clipsList.push(song);
    });
    this.clipsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.clipsList = this.clipsList.slice(0, 8);
  }

}
