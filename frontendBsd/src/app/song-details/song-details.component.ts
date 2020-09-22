import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
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

  constructor(private httpClient: HttpClient, private songService: SongService,
    private router: Router) {
  }

  ngOnInit() {
  }

  onRefresh() {
    this.router.routeReuseStrategy.shouldReuseRoute = function () { return false; };

    let currentUrl = this.router.url + '?';

    this.router.navigateByUrl(currentUrl)
      .then(() => {
        this.router.navigated = false;
        this.router.navigate([this.router.url]);
      });
  }

  ngOnChanges(): void {
    this.onRefresh();
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
