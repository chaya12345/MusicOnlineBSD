import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';

@Component({
  selector: 'app-editing-song',
  templateUrl: './editing-song.component.html',
  styleUrls: ['./editing-song.component.css','./../admin-style.css']
})
export class EditingSongComponent implements OnInit {

  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  songsControl = new FormControl();
  SelectedSong:Song;

  constructor(private songService:SongService) {
    this.songsControl = new FormControl();
    try {
      this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.updateSongsList(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
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
  songSearch(): void {
    this.songsList.forEach(song => {
      if (song.name == (document.getElementById("song-search") as HTMLInputElement).value) {
        window.location.href = "song?songId=" + song.id;
      }
    });
  }
  onSelectionChange(event): void {
    this.songsList.forEach(item => {
      if (item.name == event.option.value) {
        this.SelectedSong = item;
      }
    })
  }

}
