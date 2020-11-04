import { Component, ElementRef, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { MatSliderChange } from '@angular/material';
import { BehaviorSubject, Subject } from 'rxjs';
import { Song } from '../classes/song';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'player-actions',
  templateUrl: './player-actions.component.html',
  styleUrls: ['./player-actions.component.css']
})
export class PlayerActionsComponent implements OnInit {

  @Input() songsList: Song[] = [];
  currentProgress$ = new BehaviorSubject(0);
  currentTime$ = new Subject();

  @ViewChild('player', { static: true }) player: ElementRef;


  audio = new Audio();
  isPlaying = false;
  activeSong;
  durationTime: string;
  currentState: number = 0;
  faster;
  activeRepeat: boolean = true;
  activeShuffle: boolean = false;
  currentIndex: number = 0;

  constructor(private storageService: StorageService) { }

  ngOnInit() {
    this.player.nativeElement.src = '../../assets/songs/' + this.songsList[0].file_location;
    this.player.nativeElement.load();
    this.activeSong = this.songsList[0];
    this.isPlaying = false;
  }

  ngOnChanges() {
    this.durationTime = '0:00';
    this.player.nativeElement.src = '../../assets/songs/' + this.songsList[0].file_location;
    this.player.nativeElement.load();
    this.activeSong = this.songsList[0];
    this.isPlaying = false;
  }

  startClick = (e) => {
    console.log(e);
    this.faster = e.target.innerText == "fast_forward" ? setInterval(() => {
      if (this.player.nativeElement.currentTime + 1 < this.player.nativeElement.duration) {
        this.player.nativeElement.currentTime++;
        console.log('click');
      }
    }, 200) :
      setInterval(() => {
        if (this.player.nativeElement.currentTime - 1 > 0) {
          this.player.nativeElement.currentTime--;
          console.log('click');
        }
      }, 200);
  };

  endClick = (e) => {
    clearInterval(this.faster);
  }

  onInputChange(event: MatSliderChange) {
    this.player.nativeElement.currentTime = event.value;
  }

  playSong(auto?: boolean): void {
    if (this.player.nativeElement.src != (null && undefined) && this.activeSong != this.songsList[this.currentIndex]) {
      this.activeSong = this.songsList[this.currentIndex];
      this.durationTime = '0:00';
      this.player.nativeElement.src = '../../assets/songs/' + this.activeSong.file_location;
    }
    this.audio.pause();
    this.storageService.setItem("index", this.songsList.indexOf(this.activeSong));
    this.storageService.setItem("playing", true);
    if (auto == true && this.activeRepeat == true || auto == (false || undefined || null)) {
      this.player.nativeElement.play();
      this.isPlaying = true;
    }
  }

  onTimeUpdate() {

    // Set song duration time
    if (!this.durationTime || this.durationTime == '0:00') {
      this.setSongDuration();
    }

    // Emit converted audio currenttime in user friendly ex. 01:15
    const currentMinutes = this.generateMinutes(this.player.nativeElement.currentTime);
    const currentSeconds = this.generateSeconds(this.player.nativeElement.currentTime);
    this.currentTime$.next(this.generateTimeToDisplay(currentMinutes, currentSeconds));


    // Emit amount of song played percents
    const percents = this.generatePercentage(this.player.nativeElement.currentTime, this.player.nativeElement.duration);
    if (!isNaN(percents)) {
      this.currentProgress$.next(percents);
    }

    this.currentState = this.player.nativeElement.currentTime;

  }

  onEnded(): void {
    this.storageService.setItem("playing", false);
    this.playNextSong(true);
    // this.player.nativeElement.load();
  }

  forward(value): void {
    if (!this.player.nativeElement.paused) {
      if (this.player.nativeElement.currentTime + value < this.player.nativeElement.duration) {
        this.player.nativeElement.currentTime += value;
      }
      else {
        this.player.nativeElement.currentTime = this.player.nativeElement.duration;
      }
    }
  }

  rewind(value): void {
    if (!this.player.nativeElement.paused) {
      if (this.player.nativeElement.currentTime - value > 0) {
        this.player.nativeElement.currentTime -= value;
      }
      else {
        this.player.nativeElement.currentTime = 0;
      }
    }
  }

  // Play song that comes after active song
  playNextSong(auto?: boolean): void {
      const nextSongIndex = this.currentIndex + 1 < this.songsList.length ?
        this.currentIndex + 1 : -1;
    if (nextSongIndex === -1) {
      this.currentIndex = 0;
      this.playSong(auto);
    } else {
      this.currentIndex = nextSongIndex;
      this.playSong();
    }
  }

  // Play song that comes before active song
  playPreviousSong(): void {
    const prevSongIndex = this.currentIndex - 1 >= 0 ?
      this.currentIndex - 1 : -1;
    if (prevSongIndex === -1) {
      this.currentIndex = this.songsList.length - 1;
      this.playSong();
    } else {
      this.currentIndex = prevSongIndex;
      this.playSong();
    }
  }

  // Calculate song duration and set it to user friendly format, ex. 01:15
  setSongDuration(): void {
    const durationInMinutes = this.generateMinutes(this.player.nativeElement.duration);
    const durationInSeconds = this.generateSeconds(this.player.nativeElement.duration);

    if (!isNaN(this.player.nativeElement.duration)) {
      this.durationTime = this.generateTimeToDisplay(durationInMinutes, durationInSeconds);
    }
  }

  // Generate minutes from audio time
  generateMinutes(currentTime: number): number {
    return Math.floor(currentTime / 60);
  }

  // Generate seconds from audio time
  generateSeconds(currentTime: number): number | string {
    const secsFormula = Math.floor(currentTime % 60);
    return secsFormula < 10 ? '0' + String(secsFormula) : secsFormula;
  }

  generateTimeToDisplay(currentMinutes, currentSeconds): string {
    return `${currentMinutes}:${currentSeconds}`;
  }

  // Generate percentage of current song
  generatePercentage(currentTime: number, duration: number): number {
    return Math.round((currentTime / duration) * 100);
  }

  onPause(): void {
    this.storageService.setItem("playing", false);
    this.isPlaying = false;
    // this.currentProgress$.next(0);
    // this.currentTime$.next('0:00');
    // this.durationTime = '0:00';
  }

  getDuration(): number {
    if (this.player != undefined)
      return this.player.nativeElement.duration;
    return 0;
  }

  // getListOfSongs(): ISong[] {
  //   return [
  //     {
  //       id: 1,
  //       title: 'Evanescence-Bring Me To Life(with lyrics).mp3',
  //       path: './assets/Evanescence-Bring Me To Life(with lyrics).mp3'
  //     },
  //     {
  //       id: 2,
  //       title: 'Numb (Official Video) - Linkin Park.mp3',
  //       path: './assets/Numb (Official Video) - Linkin Park.mp3'
  //     },
  //     {
  //       id: 3,
  //       title: 'System Of A Down - Toxicity (Official Video).mp3',
  //       path: './assets/System Of A Down - Toxicity (Official Video).mp3'
  //     }
  //   ];
  // }

}
