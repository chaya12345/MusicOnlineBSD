import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'latest-performance',
  templateUrl: './latest-performance.component.html',
  styleUrls: ['./latest-performance.component.css']
})
export class LatestPerformanceComponent implements OnInit {

  latestPerformances: Song[] = [];

  constructor(private songService: SongService) {
    this.getPerformances();
  }

  ngOnInit(): void {
  }

  getPerformances(): void {
    try {
      this.songService.getPerformances().subscribe(per =>
        { this.latestPerformances = per;
          this.latestPerformances.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime())); },
          err => { console.log(err); });
    } catch (err) { console.log(err); }
  }

}
