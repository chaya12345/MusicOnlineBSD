import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';

@Component({
  selector: 'search-spesific-song',
  templateUrl: './search-spesific-song.component.html',
  styleUrls: ['./search-spesific-song.component.css']
})
export class SearchSpesificSongComponent implements OnInit {

  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  songsControl = new FormControl();

  constructor(private songService: SongService) { 
    try {
    this.songService.getSongs().subscribe(songs => {this.songsList = songs; this.updateSongsList();}, err => { console.log(err); });
    }
    catch { console.log('search-spesific'); }
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

  public _filterSongs(value: string): Song[] {
    const filterValue = value.toLowerCase();
    return this.songsList.filter(song => song.name.toLowerCase().includes(filterValue));
  }
  
}
