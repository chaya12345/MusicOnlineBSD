import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Song } from '../classes/song';
import { ShareDataService } from '../services/share-data.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'songs-page',
  templateUrl: './songs-page.component.html',
  styleUrls: ['./songs-page.component.css']
})
export class SongsPageComponent implements OnInit {

  isNarrow: boolean = false;
  songId: number = null;
  song: Song;

  constructor(private shareData: ShareDataService, private activatedRoute: ActivatedRoute, private songService: SongService) { }

  ngOnInit() {
    this.shareData.childEventListner().subscribe(isNavOpened => {
      this.isNarrow = isNavOpened;
    });
    this.activatedRoute.params.subscribe(params => {
      this.initialiseState();
    });
  }

  initialiseState(): void {
    if (this.activatedRoute.snapshot.paramMap.get('id') != null) {
      this.songId = parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
      this.getSongById();
    }
    else this.songId = null;
    this.song = null;
  }

  getSongById(): void {
    try {
      this.songService.getSongById(this.songId).subscribe(song => { this.song = song; }, err => { console.log(err); });
    }
    catch { console.log('song-details'); }
  }

}
