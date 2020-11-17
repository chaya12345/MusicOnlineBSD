import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MatSnackBar } from '@angular/material';
import { Song } from '../classes/song';
import { SongSelection } from '../classes/songSelection';
import { SurveyService } from '../services/survey.service';

@Component({
  selector: 'parade-song-of-the-year',
  templateUrl: './parade-song-of-the-year.component.html',
  styleUrls: ['./parade-song-of-the-year.component.css']
})
export class ParadeSongOfTheYearComponent implements OnInit {

  @Output() onSelect: EventEmitter<Song[]> = new EventEmitter<Song[]>();
  songs: Song[] = [];
  selectedSongs: Song[] = [];
  maxCount: number = 10;

  constructor(private surveyService: SurveyService, private _snackBar: MatSnackBar) {
    try {
      this.surveyService.getSongsInSurvey().subscribe(songs => {
        this.songs = songs;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }

  selectSong(value: Song): void {
    if (this.selectedSongs.length < this.maxCount && !this.selectedSongs.includes(value)) {
      this.selectedSongs.push(value);
    }
    else if (this.selectedSongs.includes(value)) {
      let index = this.selectedSongs.indexOf(value);
      this.selectedSongs.splice(index, 1);
    }
    this.onSelect.emit(this.selectedSongs);
  }

  // openSnackBar(message: string) {
  //   this._snackBar.open(message, '', {
  //     duration: 2000,
  //   });
  // }

}
