import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'm-performance',
  templateUrl: './m-performance.component.html',
  styleUrls: ['./m-performance.component.css', './../m-style.css']
})
export class MPerformanceComponent implements OnInit {

  performances: Song[] = [];

  constructor(private songService: SongService) {
    this.getPers();
  }

  ngOnInit(): void {
  }

  getPers(): void {
    try {
      this.songService.getPerformances().subscribe(pers => {
        this.performances = pers;
        this.performances.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.performances = this.performances.slice(0, 4);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
