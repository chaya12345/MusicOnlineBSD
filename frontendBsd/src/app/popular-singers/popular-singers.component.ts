import { Component, OnInit } from '@angular/core';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';

@Component({
  selector: 'popular-singers',
  templateUrl: './popular-singers.component.html',
  styleUrls: ['./popular-singers.component.css']
})
export class PopularSingersComponent implements OnInit {

  singers: Singer[] = [];

  constructor(private singerService: SingerService) { 
    try {
      this.singerService.getSingers().subscribe(singers => { this.singers = singers; this.order(); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }

  order(): void {
    this.singers.sort((a, b) => Math.round(b.searchings - a.searchings));
    this.singers = this.singers.slice(0, 12);
  }

}
