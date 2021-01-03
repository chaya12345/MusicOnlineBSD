import { Component, ElementRef, EventEmitter, OnInit, Output, ViewChild } from '@angular/core';
import { FormControl } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { SingerService } from '../services/singer.service';
import { SongService } from '../services/song.service';
import { Router } from '@angular/router';
import { User } from '../classes/user';
import { SingerSearchingToUserService } from '../services/singer-searching-to-user.service';

@Component({
  selector: 'search-mini',
  templateUrl: './search-mini.component.html',
  styleUrls: ['./search-mini.component.css']
})
export class SearchMiniComponent implements OnInit {

  @Output() opened: EventEmitter<void> = new EventEmitter();
  @Output() closed: EventEmitter<void> = new EventEmitter();
  @ViewChild("autoSongs") autoSongs: ElementRef;
  @ViewChild("autoSingers") autoSingers: ElementRef;
  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  songsControl = new FormControl();

  filteredSingers: Observable<Singer[]>;
  singersControl = new FormControl();
  singersList: Singer[] = [];

  constructor(private songService: SongService, private singerService: SingerService, private router: Router,
    private singerSearchingToUserService: SingerSearchingToUserService) {
    this.songsControl = new FormControl();
    this.singersControl = new FormControl();
    try {
      this.songService.getSongs()
        .subscribe(songs => { this.songsList = songs; this.orderByName(this.songsList); this.updateSongsList(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
    try {
      this.singerService.getSingers()
        .subscribe(singers => { this.singersList = singers; this.orderByName(this.singersList); this.updateSingersList(); }, err => { console.log(err); });
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

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  isOpened(open: boolean) {
    open ? this.opened.emit() : this.closed.emit();
  }

  songSearch(): void {
    this.songsList.forEach(song => {
      if (song.name == (document.getElementById("song-search") as HTMLInputElement).value) {
        window.location.href = "song?songId=" + song.id;
      }
    });
  }

  singerSearch(): void {
    this.singersList.forEach(singer => {
      if (singer.name == (document.getElementById("singer-search") as HTMLInputElement).value) {
        window.location.href = "song?filter=" + singer.name;
        this.searchingSinger(singer);
      }
    });

  }
  searchingSinger(singer: Singer) {
    this.singerService.addSearchingToSinger(singer.name).subscribe();
    if (sessionStorage.getItem('user') != null && sessionStorage.getItem('user') != undefined) {
      let user: User = JSON.parse(sessionStorage.getItem('user'));
       this.singerSearchingToUserService.addSingerSearchingToUser(user.id, singer.id).subscribe();
    }
  }

}
