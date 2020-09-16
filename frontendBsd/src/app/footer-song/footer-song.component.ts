import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { LikeService } from '../services/like.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'footer-song',
  templateUrl: './footer-song.component.html',
  styleUrls: ['./footer-song.component.css'],
  providers: [LikeService]
})
export class FooterSongComponent implements OnInit {

  @Input() song: Song;
  @Input() is_parent_hovered: boolean;
  song_functionality;
  isPlay: boolean = false;
  audio: any = new Audio();
  max: number = 0;
  value: number = 5;
  intervalSlide;
  num: number = 1;

  constructor(private song_service: LikeService, private songService: SongService) { }

  ngOnInit() {
    this.song_functionality = this.song_service;
    this.audio.src = '../../assets/songs/' + this.song.file_location;
    this.max = this.audio.duration
  }

  sign(event): void {
    this.song_functionality.toggle_like(event);
    this.num++;
    this.num % 2 == 0 ? this.addLike() : this.MissLike();
  }

  marking(event): void {
    this.song_functionality.change_like_color(event);
  }

  reset_marking(event): void {
    this.song_functionality.reset_like_color(event);
  }
  addLike(): void {
    this.songService.increaseLikeToSong(this.song.id).subscribe();
  }
  MissLike(): void {
    this.songService.decreaseLikeToSong(this.song.id).subscribe();
  }
}
