import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { LikeService } from '../services/like.service';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'footer-song',
  templateUrl: './footer-song.component.html',
  styleUrls: ['./footer-song.component.css']
})
export class FooterSongComponent implements OnInit {

  @Input() song: Song;
  countRes: number = 0;

  constructor(private resToSongsService: ResponseToSongsService, private cdr: ChangeDetectorRef) { }

  ngOnInit() {
    this.getCountResponses();
  }

  getCountResponses(): void {
    try {
      this.resToSongsService.getCountResponsesToSong(this.song.id)
      .subscribe(count => { this.countRes = count; this.cdr.detectChanges(); }, err => { console.log(err); }); }
      catch (err) { console.log(err); }
  }

}
