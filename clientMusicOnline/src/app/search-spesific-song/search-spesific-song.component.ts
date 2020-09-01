import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';

@Component({
  selector: 'search-spesific-song',
  templateUrl: './search-spesific-song.component.html',
  styleUrls: ['./search-spesific-song.component.css']
})
export class SearchSpesificSongComponent implements OnInit {

  filteredSongs: Observable<string[]>;
  songs: string[] = [
    'אנא',
    'נכספתי',
    'מלחמות',
    'האמונה בוערת',
    'אלוקי נשמה',
    'כוכבים'
  ];
  songsControl = new FormControl();

  constructor() { }

  ngOnInit() {
    this.filteredSongs = this.songsControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSongs(value))
      );
  }

  public _filterSongs(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.songs.filter(client => client.toLowerCase().includes(filterValue));
  }
  
}
