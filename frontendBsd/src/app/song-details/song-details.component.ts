import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'song-details',
  templateUrl: './song-details.component.html',
  styleUrls: ['./song-details.component.css']
})
export class SongDetailsComponent implements OnInit {

  songId: number;
  @Input() song: Song;
  songContent: string = "";
  similarSongs: Song[] = [];

  constructor(private httpClient: HttpClient, private songService: SongService) {
  }

  ngOnInit() {
  }

  ngOnChanges(): void {
    try {
    this.getContent();
    this.getSimilarResults();
    } catch { }
  }

  getContent(): void {
    this.httpClient.get('../../assets/text/' + this.song.content, {
      responseType: 'text'
    }).subscribe(data => { this.songContent = data; });
  }

  getSimilarResults(): void {
    try {
      this.songService.getSimilarSongs(this.song.id)
      .subscribe(song => { this.similarSongs = song; this.filter(); }, err => { console.log(err); });
    }
    catch { console.log('playlist'); }
  }

  filter(): void {
    this.similarSongs = this.similarSongs.slice(0, 3);
    console.log(this.similarSongs);
  }

}
