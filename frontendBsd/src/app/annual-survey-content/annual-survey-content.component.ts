import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongSelection } from '../classes/songSelection';
import { SurveyService } from '../services/survey.service';

@Component({
  selector: 'annual-survey-content',
  templateUrl: './annual-survey-content.component.html',
  styleUrls: ['./annual-survey-content.component.css']
})
export class AnnualSurveyContentComponent implements OnInit {

  @Input() imgSurvey: string = "";
  songs: Song[] = [];
  selectedSongs: Song[] = [];
  maxCount: number = 10;
  countPossible: number;

  constructor(private surveyService: SurveyService) {
    try {
      this.surveyService.getSongsInSurvey().subscribe(songs => {
        this.songs = songs;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
    this.countPossible = this.maxCount;
  }

  ngOnInit(): void {
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
    /* TODO -- saving selected songs -- */
    /* TODO -- showing suitable massage -- */
  }

}
