import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { CommitsToSongsService } from '../services/commits-to-songs.service';
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

  constructor(private commitToSongsService: CommitsToSongsService) { }

  ngOnInit(): void {
  }

  ngOnChanges() {
    if (this.currentSong != null) {
      try {
        this.commitToSongsService.getCountCommitsToSong(this.currentSong.id)
          .subscribe(count => this.countRes = count, err => console.log(err));
      } catch (err) { console.log(err); }
    }
  }

}
