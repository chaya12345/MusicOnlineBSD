import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Song } from '../classes/song';
import { SongsDetailsView } from '../classes/songsDetailsView';
import { SongService } from '../services/song.service';

@Component({
  selector: 'songs-by-singer',
  templateUrl: './songs-by-singer.component.html',
  styleUrls: ['./songs-by-singer.component.css']
})
export class SongsBySingerComponent implements OnInit {

  singerName: string = "";
  songsList: SongsDetailsView[] = [];
  navs: string[] = [];

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService) { }

  ngOnInit() {
    this.activatedRoute.params.subscribe(params => {
      this.initialiseState();
    });
    this.navs.push("חדש במוזיקה", this.singerName);
  }

  initialiseState(): void {
    if (this.activatedRoute.snapshot.paramMap.get('filter') == "filterBySinger") {
      if (this.activatedRoute.snapshot.paramMap.get('value') != null) {
        this.singerName = this.activatedRoute.snapshot.paramMap.get('value');
        this.getSongsBySinger();
      }
    }
    else if (this.activatedRoute.snapshot.paramMap.get('filter') == "filterByTag") {
      if (this.activatedRoute.snapshot.paramMap.get('value') != null) {
        this.singerName = this.activatedRoute.snapshot.paramMap.get('value');
        this.getSongsByTag();
      }
    }
    else if (this.activatedRoute.snapshot.paramMap.get('filter') == "filterByArtist") {
      if (this.activatedRoute.snapshot.paramMap.get('value') != null) {
        this.singerName = this.activatedRoute.snapshot.paramMap.get('value');
        this.getSongsByArtist();
      }
    }
  }

  getSongsBySinger() {
    try {
      this.songService.getSongsBySinger(this.singerName)
        .subscribe(songs => { this.songsList = songs; this.orderByDate(); }, err => { console.log(err); });
    } catch (err) { console.log(err); }
  }

  getSongsByTag() {
    try {
      this.songService.getSongsByTag(this.singerName)
        .subscribe(songs => { this.songsList = songs; this.orderByDate(); }, err => { console.log(err); });
    } catch (err) { console.log(err); }
  }

  getSongsByArtist() {
    try {
      this.songService.getSongsByArtistsAndSingers(this.singerName)
        .subscribe(songs => { this.songsList = songs; this.orderByDate(); }, err => { console.log(err); });
    } catch (err) { console.log(err); }
  }

  orderByDate() {
    this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

}
