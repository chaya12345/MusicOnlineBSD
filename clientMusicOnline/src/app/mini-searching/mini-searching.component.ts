import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';

@Component({
  selector: 'mini-searching',
  templateUrl: './mini-searching.component.html',
  styleUrls: ['./mini-searching.component.css']
})
export class MiniSearchingComponent implements OnInit {

  filteredSongs: Observable<Song[]>;
  filteredSingers: Observable<Singer[]>;
  songsControl = new FormControl();
  singersControl = new FormControl();

  songsList: Song[] = [];
  singersList: Singer[] = [];

  constructor(private songService: SongService, private singerService: SingerService) {
    this.songsControl = new FormControl();
    this.singersControl = new FormControl();
    try {
    this.songService.getSongs().subscribe(songs => {this.songsList = songs; this.updateSongsList();}, err => { console.log(err); });
    }
    catch { console.log('mini-searching'); }
    try {
    this.singerService.getSingers().subscribe(singers => {this.singersList = singers; this.updateSingersList();}, err => { console.log(err); });
    }
    catch { console.log('mini-searching'); }
  }

  ngOnInit() {
  }

  public updateSongsList(): void {
      this.filteredSongs = this.songsControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSongs(value))
      );
  }

  public updateSingersList(): void {
    this.filteredSingers = this.singersControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSongs(value: string): Song[] {
    const filterValue = value.toLowerCase();
    return this.songsList.filter(song => song.name.toLowerCase().includes(filterValue));
  }

  public _filterSingers(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.singersList.filter(singer => singer.name.toLowerCase().includes(filterValue));
  }

}
