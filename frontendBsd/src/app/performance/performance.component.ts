import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { Topics } from '../classes/topics';
import { SongService } from '../services/song.service';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'performance',
  templateUrl: './performance.component.html',
  styleUrls: ['./performance.component.css']
})
export class PerformanceComponent implements OnInit {

  topic: Topics = new Topics;
  navs: string[] = [];
  songs: Song[] = [];
  orderBy;

  constructor(private topicsService: TopicsService, private songService: SongService) {
    try {
      this.topicsService.getTopic("הופעות").subscribe(t => this.topic = t, err => console.log(err));
    } catch (err) { console.log(err); }
    this.navs.push("הופעות");
    try {
      this.songService.getPerformances().subscribe(songs => this.songs = songs, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }

}
