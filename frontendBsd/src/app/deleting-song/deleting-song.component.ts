import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
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

  @ViewChild("autoSongs") autoSongs: ElementRef;

  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  SelectedSong: Song;
  songFormGroup: FormGroup;

  constructor(private songService: SongService, public dialog: MatDialog, private _snackBar: MatSnackBar,
    private cmService: CommonMessageService) {
    this.songFormGroup = new FormGroup({
      song: new FormControl("", Validators.required)
    });
    this.getSongs();
  }

  getSongs() {
    try {
      this.songService.getSongs().subscribe(songs => {
        this.songsList = songs; this.updateSongsList();
      }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }

  confirm(): void {
    this.openMessageDialog("האם אתה בטוח שברצונך למחוק את השיר?");
  }

  public updateSongsList(): void {
    this.filteredSongs = this.songFormGroup.controls.song.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSongs(value))
      );
  }

  public _filterSongs(value: string): Song[] {
    const filterValue = value.toLowerCase();
    return this.songsList.filter(song => song.name.toLowerCase().includes(filterValue));
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
      this.songService.deleteSong(this.SelectedSong.id)
      .subscribe(res => {
        if (res) {
          this.deleteSongFromList();
        }
        this.openSnackBar(res ? this.cmService.DELETE_ITEM.SUCCESS : 
        this.cmService.DELETE_ITEM.ERROR) },
        () => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  deleteSongFromList() {
    this.songsList.splice(this.songsList.indexOf(this.SelectedSong), 1);
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
