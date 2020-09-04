import { Component, OnInit, Input } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'player',
  templateUrl: './player.component.html',
  styleUrls: ['./player.component.css']
})
export class PlayerComponent implements OnInit {
  
  @Input() song: Song;
  @Input() is_parent_hovered: boolean;
  is_play: boolean = false;
  is_fullscreen: boolean = false;
  max: number = 1;
  value: number = 0;
  audio: any = new Audio();
  intervalSlide;

  constructor() { }

  ngOnInit() {
    this.audio.src = '../../assets/songs/' + this.song.file_location;
  }

  play(): void {
    this.is_play = !this.is_play;
    this.max = this.audio.duration;
    this.audio.play();
    this.updateSlider();
    this.intervalSlide = setInterval(() => {
      this.updateSlider(); 
      }, 100);
  }

  pause(): void {
    this.is_play = !this.is_play;
    this.audio.pause();
    clearInterval(this.intervalSlide);
  }

  updateSlider(): void {
    this.value = this.audio.currentTime;
  }

  fullscreen(): void {
    this.is_fullscreen = !this.is_fullscreen;
  }

}
