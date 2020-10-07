import { Component, Input, OnInit } from '@angular/core';
import { MatSliderChange } from '@angular/material';
import { Song } from '../classes/song';

@Component({
  selector: 'song-in-playlist',
  templateUrl: './song-in-playlist.component.html',
  styleUrls: ['./song-in-playlist.component.css']
})
export class SongInPlaylistComponent implements OnInit {

  @Input() song: Song;
  isPlay: boolean = false;
  checked: boolean = true;
  src: HTMLAudioElement;
  volume: number = 10;
  showSlider: boolean = false;

  constructor() {
  }

  ngOnInit() {
    localStorage.setItem('isPlay', 'false');
    this.src = new Audio("../../assets/songs/" + this.song.file_location);
    this.src.addEventListener('ended', () => {
      this.pause();
    });
    // this.src.volume = this.volume;
  }

  play(): void {
    if (localStorage.getItem('isPlay') == 'false') {
      if (localStorage.getItem('previousSong') != this.song.id.toString()) {
        this.src.load();
        this.src.onended;
      }
      this.isPlay = true;
      this.src.play();
      localStorage.setItem('isPlay', 'true');
      localStorage.setItem('currentSong', this.song.id.toString());
    }
  }

  pause(): void {
    this.isPlay = false;
    this.src.pause();
    localStorage.setItem('isPlay', 'false');
    localStorage.setItem('previousSong', localStorage.getItem('currentSong'));
    localStorage.setItem('currentSong', null);
  }

  toggle(): void {
    this.isPlay == true ? this.pause() : this.play();
  }

  onInputChange(event: MatSliderChange) {
    console.log("This is emitted as the thumb slides");
    console.log(event.value);
    this.src.volume = event.value;
  }

  toggleShowing(): void {
    this.showSlider = !this.showSlider;
    console.log(this.showSlider);
  }

}
