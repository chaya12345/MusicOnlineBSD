import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { LikeService } from '../services/like.service';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'footer-song',
  templateUrl: './footer-song.component.html',
  styleUrls: ['./footer-song.component.css'],
  providers: [LikeService]
})
export class FooterSongComponent implements OnInit {

  @Input() song: Song;
  song_functionality;
  countRes: number = 0;
  toggle: boolean = false;

  constructor(private song_service: LikeService, private songService: SongService,
    private resToSongsService: ResponseToSongsService, private cdr: ChangeDetectorRef) { }

  ngOnInit() {
    this.song_functionality = this.song_service;
    this.getCountResponses();
  }

  sign(event): void {
    this.song_functionality.toggle_like(event);
    this.toggle == false? this.addLike() : this.MissLike();
    this.toggle = !this.toggle;
  }

  marking(event): void {
    this.song_functionality.change_like_color(event);
  }

  reset_marking(event): void {
    this.song_functionality.reset_like_color(event);
  }
  
  addLike(): void {
    this.song.count_like = this.song.count_like + 1;
    this.songService.increaseLikeToSong(this.song.id).subscribe();
  }

  MissLike(): void {
    this.song.count_like=this.song.count_like-1;
    this.songService.decreaseLikeToSong(this.song.id).subscribe();
  }

  getCountResponses(): void {
    try {
      this.resToSongsService.getCountResponsesToSong(this.song.id)
      .subscribe(count => { this.countRes = count; this.cdr.detectChanges(); }, err => { console.log(err); }); }
    catch { console.log("count resopnses failed"); }
  }

}
