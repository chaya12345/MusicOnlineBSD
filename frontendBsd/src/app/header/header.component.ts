import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';
import { Router } from '@angular/router';

@Component({
  selector: 'header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  
  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  songsControl = new FormControl();

  filteredSingers: Observable<Singer[]>;
  singersControl = new FormControl();
  singersList: Singer[] = [];

  constructor(private songService: SongService, private singerService: SingerService, private router: Router) { 
    this.songsControl = new FormControl();
    this.singersControl = new FormControl();
    try {
    this.songService.getSongs()
    .subscribe(songs => {this.songsList = songs; this.orderByName(this.songsList); this.updateSongsList();}, err => { console.log(err); });
    }
    catch { console.log('search-spesific'); }
    try {
    this.singerService.getSingers()
    .subscribe(singers => {this.singersList = singers; this.orderByName(this.singersList); this.updateSingersList();}, err => { console.log(err); });
    }
    catch { console.log('mini-searching'); }
  }

  ngOnInit(): void {
  }

  public updateSongsList(): void {
    this.filteredSongs = this.songsControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSongs(value))
      );
  }

  public _filterSongs(value: string): Song[] {
    const filterValue = value.toLowerCase();
    return this.songsList.filter(song => song.name.toLowerCase().includes(filterValue));
  }

  public updateSingersList(): void {
    this.filteredSingers = this.singersControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSingers(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.singersList.filter(singer => singer.name.toLowerCase().includes(filterValue));
  }

  openSong(currentSong: Song) {
    console.log(currentSong);
    this.router.navigateByUrl("song/" + currentSong.id);
  }

  openSongsBySinger(singer: Singer) {
    this.router.navigateByUrl("songs/" + singer.name);
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

}
