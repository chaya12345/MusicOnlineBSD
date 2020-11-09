import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'song-info',
  templateUrl: './song-info.component.html',
  styleUrls: ['./song-info.component.css']
})
export class SongInfoComponent implements OnInit {

  @Input() currentSong: Song;
  rate: number = 3.14;
  countRes: number = 0;

  constructor(private responseToSongsService: ResponseToSongsService) { }

  ngOnInit(): void {
  }

  ngOnChanges() {
    if (this.currentSong != null) {
      try {
        this.responseToSongsService.getCountResponsesToSong(this.currentSong.id)
          .subscribe(count => this.countRes = count, err => console.log(err));
      } catch (err) { console.log(err); }
    }
  }

}
