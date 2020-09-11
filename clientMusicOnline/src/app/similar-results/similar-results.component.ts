import { Component, OnInit, Input } from '@angular/core';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';

@Component({
  selector: 'similar-results',
  templateUrl: './similar-results.component.html',
  styleUrls: ['./similar-results.component.css']
})
export class SimilarResultsComponent implements OnInit {

  @Input() currentSongId: number;
  similarSongs: Song[] = [];

  constructor(private songService: SongService) {
   }

  ngOnInit() {
  }

  
  ngOnChanges() {
    try {
    this.songService.getSimilarSongs(this.currentSongId).subscribe(song => { this.similarSongs = song; this.filter(); }, err => { console.log(err); });
    }
    catch { console.log('similar-results'); }
  }

  filter(): void {
    this.similarSongs = this.similarSongs.slice(0, 3);
  }

}
