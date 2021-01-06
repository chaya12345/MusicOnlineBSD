import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MatSnackBar } from '@angular/material';
import { ItemsToParade } from '../classes/itemsToParade';
import { Singer } from '../classes/singer';
import { ParadeService } from '../services/parade.service';
import { SingersToParadeService } from '../services/singers-to-parade.service';

@Component({
  selector: 'parade-singer-of-the-year',
  templateUrl: './parade-singer-of-the-year.component.html',
  styleUrls: ['./parade-singer-of-the-year.component.css']
})
export class ParadeSingerOfTheYearComponent implements OnInit {

  @Output() onSelect: EventEmitter<Singer> = new EventEmitter<Singer>();
  singers: ItemsToParade[] = [];
  selectedSinger: Singer;
  focus: number;
  // maxCount: number = 10;
  // countPossible: number;

  constructor(private singersToParadeService: SingersToParadeService, private _snackBar: MatSnackBar) { 
    try {
      this.singersToParadeService.getSingersInParade()
      .subscribe(singers => { this.singers = singers; this.singers.sort((a,b)=>a.name.localeCompare(b.name)); },
       err => console.log(err));
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
