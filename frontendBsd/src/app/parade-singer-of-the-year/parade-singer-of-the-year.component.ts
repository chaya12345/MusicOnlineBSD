import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MatSnackBar } from '@angular/material';
import { Singer } from '../classes/singer';
import { ParadeService } from '../services/parade.service';

@Component({
  selector: 'parade-singer-of-the-year',
  templateUrl: './parade-singer-of-the-year.component.html',
  styleUrls: ['./parade-singer-of-the-year.component.css']
})
export class ParadeSingerOfTheYearComponent implements OnInit {

  @Output() onSelect: EventEmitter<Singer> = new EventEmitter<Singer>();
  singers: Singer[] = [];
  selectedSinger: Singer;
  focus: number;
  // maxCount: number = 10;
  // countPossible: number;

  constructor(private paradeService: ParadeService, private _snackBar: MatSnackBar) { 
    try {
      this.paradeService.getSingersInParade()
      .subscribe(singers => { this.singers = singers; console.log("singers"); console.log(singers); }, err => console.log(err));
    } catch (err) { console.log(err); }
    // this.countPossible = this.maxCount;
  }

  ngOnInit(): void {
  }

  // openSnackBar(message: string) {
    // this._snackBar.open(message, '', {
    //   duration: 2000,
    // });
  // }

  // saveSelection(): void {
    // this.surveyService.addVotingToSongs(this.selectedSongs).subscribe(
    //   succses => { this.openSnackBar("ההצבעה נשמרה!"); this.selectedSongs = []; this.countPossible = this.maxCount; },
    //   err => { console.log(err); this.openSnackBar("בשל תקלה זמנית לא ניתן להצביע כעת, אנא נסו מאוחר יותר");});
    /* TODO -- לנקות את העיצוב אחרי ההצבעה -- */
    /* TODO -- showing suitable massage -- */
  // }

  // selectSinger(value: SingerSelection) {
  //   console.log("נבחר הזמר - " + value.singer.name);
  //   this.selectedSinger = value.singer;
  // }

  selectSinger(singer: Singer): void {
    if (this.selectedSinger == singer) {
      this.selectedSinger = null;
    }
    else {
      this.selectedSinger = singer;
    }
    this.onSelect.emit(this.selectedSinger);
  }

}
