import { Component, OnInit } from '@angular/core';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';

@Component({
  selector: 'parade-body',
  templateUrl: './parade-body.component.html',
  styleUrls: ['./parade-body.component.css']
})
export class ParadeBodyComponent implements OnInit {

  panelOpenState1: boolean = true;
  panelOpenState2: boolean = true;
  yearSingerMessage: string = "";
  yearSongMessage: string = "";
  baseMessageYearSinger: string = "בחרו את זמר השנה שלכם";
  baseMessageYearSong: string = "בחרו 10 שירים שעשו לכם את השנה";
  selectedYearSinger: boolean = false;
  selectedYearSong: boolean = false;
  votedYearSong: boolean = false;
  votedYearSinger: boolean = false;
  maxCount: number = 10;

  constructor() { 
    this.yearSingerMessage = this.baseMessageYearSinger;
    this.yearSongMessage = this.baseMessageYearSong;
  }

  ngOnInit(): void {
  }

  updateSingerSelection(value: Singer): void {
    if (value != null) {
      this.yearSingerMessage = "זמר השנה שלי הוא - " + value.name;
      this.selectedYearSinger = true;
    }
    else {
      this.yearSingerMessage = this.baseMessageYearSinger;
      this.selectedYearSinger = false;
    }
  }

  updateSongSelection(songs: Song[]): void {
    let value = songs.length;
    if (value == null || value == 0) {
      this.yearSongMessage = this.baseMessageYearSong;
      this.selectedYearSong = false;
    }
    else if (value == this.maxCount) {
      this.yearSongMessage = "בחרתי את עשרת השירים שעשו לי את השנה >>";
      this.selectedYearSong = true;
    }
    else {
      let rest = 10 - value;
      this.yearSongMessage = "נותרו לך לבחור " + rest + " שירים";
      this.selectedYearSong = false;
    }
  }

  sendYearSongVoting(): void {
    this.votedYearSong = true;
    this.yearSongMessage = "ההצבעה בוצעה";
    this.selectedYearSong = false;
  }

  sendYearSingerVoting(): void {
    this.votedYearSinger = true;
    this.yearSingerMessage = "ההצבעה בוצעה";
    this.selectedYearSinger = false;
  }

}
