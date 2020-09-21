import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'reporting',
  templateUrl: './reporting.component.html',
  styleUrls: ['./reporting.component.css']
})
export class ReportingComponent implements OnInit {

  songId: number = null;
  song: Song;

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService) {  }

  ngOnInit() {
    if (this.activatedRoute.snapshot.paramMap.get('id') != null)
      this.songId = parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
    else this.songId = null;
    this.getSongById();
  }

  getSongById(): void {
    try {
    this.songService.getSongById(this.songId).subscribe(song => { this.song = song; }, err => { console.log(err); });
    }
    catch { console.log('reporting'); }
  }

}
