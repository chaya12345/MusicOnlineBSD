import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';

@Component({
  selector: 'mini-searching',
  templateUrl: './mini-searching.component.html',
  styleUrls: ['./mini-searching.component.css']
})
export class MiniSearchingComponent implements OnInit {

  filteredSongs: Observable<string[]>;
  filteredSingers: Observable<string[]>;
  songs: string[] = [
    'אנא',
    'נכספתי',
    'מלחמות',
    'האמונה בוערת',
    'אלוקי נשמה',
    'כוכבים'
  ];
  singers: string[] = [
    'איציק דדיה',
    'פיני איינהורן',
    'יעקב שוואקי',
    'אריק דביר',
    'קובי בקרומר',
    'אברהם פריד'
  ];
  songsControl = new FormControl();
  singersControl = new FormControl();

  songsList: Song[] = [];

  constructor(private songService: SongService) {
    this.songsControl = new FormControl();
    this.singersControl = new FormControl();
  }

  ngOnInit() {
    this.songService.getSongsList().subscribe(songs => this.songsList = songs);
    // console.log(this.songsList);

    this.filteredSongs = this.songsControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSongs(value))
      );

    this.filteredSingers = this.singersControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSongs(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.songs.filter(client => client.toLowerCase().includes(filterValue));
  }

  public _filterSingers(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.singers.filter(singer => singer.toLowerCase().includes(filterValue));
  }

}
