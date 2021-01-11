import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Song } from '../classes/song';
import { MessageComponent } from '../message/message.component';
import { CommonMessageService } from '../services/common-message.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'deleting-song',
  templateUrl: './deleting-song.component.html',
  styleUrls: ['./deleting-song.component.css']
})
export class DeletingSongComponent implements OnInit {

  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  songsControl = new FormControl();
  SelectedSong:Song;

  constructor(private songService:SongService,public dialog: MatDialog,private _snackBar: MatSnackBar,
     private cmService: CommonMessageService) {
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

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.deleteSong();
      });
    } catch (err) { console.log(err); }
  }

  deleteSong() {
    try {
      this.songService.deleteSong(this.SelectedSong.id).subscribe(suc => this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }
  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
