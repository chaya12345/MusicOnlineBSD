import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material';
import { LogInComponent } from '../log-in/log-in.component';
import { MessageComponent } from '../message/message.component';

export interface messange {
  text: string;
}

@Component({
  selector: 'header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  // @ViewChild('option', {static: true}) option: ElementRef<HTMLElement>;
  connected: boolean = true;
  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  songsControl = new FormControl();

  filteredSingers: Observable<Singer[]>;
  singersControl = new FormControl();
  singersList: Singer[] = [];
  text: string = "האם אתה בטוח שברצונך להתנתק?";

  constructor(private songService: SongService, private singerService: SingerService, private router: Router,
    public dialog: MatDialog) {
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
    this.isConnected();
  }

  isConnected() {
    if (sessionStorage.getItem('user') != null && sessionStorage.getItem('user') != undefined) {
      this.connected = true;
    }
    else { this.connected = false; }
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

  triggerClick() {
    // console.log(this.option);
    // let el: HTMLElement = this.option.nativeElement;
    let el: HTMLElement = document.querySelector('a.search-song')[0];
    console.log(el);
    el.click();
  }

  search(value: string) {
    console.log(value);
  }

  openLoginDialog() {
    try {
      const dialogRef = this.dialog.open(LogInComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => {
        this.isConnected();
      });
    } catch (err) { console.log(err); }
  }

  logout() {
    sessionStorage.removeItem('user');
    this.connected = false;
  }
  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.logout();
        else this.isConnected();
      });
    } catch (err) { console.log(err); }
  }
}