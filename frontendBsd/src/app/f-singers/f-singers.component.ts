import { Component, OnInit } from '@angular/core';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';

@Component({
  selector: 'f-singers',
  templateUrl: './f-singers.component.html',
  styleUrls: ['./f-singers.component.css', './../f-style.css']
})
export class FSingersComponent implements OnInit {

  singers: Singer[] = [];

  constructor(private singerService: SingerService) {
    this.getPopularSingers();
  }

  ngOnInit(): void {
  }

  getPopularSingers(): void {
    try {
      this.singerService.getSingers().subscribe(singers => {
        this.singers = singers;
        this.singers.sort((a, b) => Math.round(b.searchings - a.searchings));
        this.singers = this.singers.slice(0, 9);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
