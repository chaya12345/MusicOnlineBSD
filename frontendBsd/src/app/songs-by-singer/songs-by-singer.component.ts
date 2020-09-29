import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'songs-by-singer',
  templateUrl: './songs-by-singer.component.html',
  styleUrls: ['./songs-by-singer.component.css']
})
export class SongsBySingerComponent implements OnInit {

  singerName: string = "";
  songsList: Song[] = [];
  navs: string[] = [];

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService) { }

  ngOnInit() {
    this.activatedRoute.params.subscribe(params => {
      this.initialiseState();
    });
    this.navs.push("חדש במוזיקה", this.singerName);
  }

  initialiseState(): void {
    if (this.activatedRoute.snapshot.paramMap.get('singerName') != null) {
      this.singerName = this.activatedRoute.snapshot.paramMap.get('singerName');
      this.getSongsBySinger();
    }
  }

  getSongsBySinger() {
    try {
    this.songService.getSongsBySinger(this.singerName)
    .subscribe(songs => { this.songsList = songs; this.orderByDate(); }, err => { console.log(err); });
    } catch { console.log("songs by singer failed"); }
  }

  orderByDate() {
    this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

}
