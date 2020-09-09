import { Component, OnInit, Input } from '@angular/core';
import { LikeService } from '../services/like.service';
import { Song } from '../classes/song';

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

  constructor(private song_service: LikeService) {
    //   
  }

  ngOnInit() {
    this.song_functionality = this.song_service;
    this.audio.src = '../../assets/songs/' + this.song.file_location;
    this.max = this.audio.duration;
    console.log('max' + this.max);
  }

  sign(event): void {
    this.song_functionality.toggle_like(event);
  }

  marking(event): void {
    this.song_functionality.change_like_color(event);
  }

  reset_marking(event): void {
    this.song_functionality.reset_like_color(event);
  }

  play(event): void {
    if (this.audio.canPlayType) {
      if (this.isPlay == false) {
        // this.audio.load();
        this.audio.play();
        event.target.innerHTML = "pause";
        this.updateSlider();
        this.intervalSlide = setInterval(() => {
          this.updateSlider(); 
          }, 100);
          this.max = this.audio.duration;
          console.log('max ' + this.max);
          console.log('dur ' + this.audio.duration);
      }
      else {
        this.audio.pause();
        event.target.innerHTML = "play_arrow";
        clearInterval(this.intervalSlide);
      }
      this.isPlay = !this.isPlay;
      console.log(this.audio.currentTime);
      console.log(this.audio.duration);
    }
    else {
      console.log("cannot play");
    }
  }

  updateSlider(): void {
    this.value = this.audio.currentTime;
  }

  changeValue(event): void {
    this.audio.currentTime = this.value;
  }

}
