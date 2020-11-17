import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatSnackBar, MatAccordion } from '@angular/material';
import { Song } from '../classes/song';
import { SongSelection } from '../classes/songSelection';
import { ParadeService } from '../services/parade.service';

@Component({
  selector: 'annual-survey-content',
  templateUrl: './annual-survey-content.component.html',
  styleUrls: ['./annual-survey-content.component.css']
})
export class AnnualSurveyContentComponent implements OnInit {

  @ViewChild(MatAccordion) accordion: MatAccordion;
  @Input() imgSurvey: string = "";
  songs: Song[] = [];
  selectedSongs: Song[] = [];
  maxCount: number = 10;
  countPossible: number;
  reset: boolean = false;

  constructor(private paradeService: ParadeService, private _snackBar: MatSnackBar) {
    try {
      this.paradeService.getSongsInParade().subscribe(songs => {
        this.songs = songs;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
    this.countPossible = this.maxCount;
  }

  ngOnInit(): void {
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  addSong(value: SongSelection): void {
    if (this.countPossible > 0 && value.select == true) {
      this.selectedSongs.push(value.song);
      this.countPossible = this.maxCount - this.selectedSongs.length;
    }
    else if (value.select == false) {
      this.selectedSongs = this.selectedSongs.filter(obj => obj !== value.song);
      this.countPossible = this.maxCount - this.selectedSongs.length;
    }
  }

  saveSelection(): void {
    this.paradeService.addVotingToSongs(this.selectedSongs).subscribe(
      succses => { this.openSnackBar("ההצבעה נשמרה!"); this.selectedSongs = []; this.countPossible = this.maxCount; this.reset = true; },
      err => { console.log(err); this.openSnackBar("בשל תקלה זמנית לא ניתן להצביע כעת, אנא נסו מאוחר יותר");});
    /* TODO -- לנקות את העיצוב אחרי ההצבעה -- */
    /* TODO -- showing suitable massage -- */
  }

}
