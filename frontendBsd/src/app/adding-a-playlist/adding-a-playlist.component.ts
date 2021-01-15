import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Playlists } from '../classes/playlists';
import { Song } from '../classes/song';
import { CommonMessageService } from '../services/common-message.service';
import { PlaylistsService, playlistWithSongs } from '../services/playlists.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'adding-a-playlist',
  templateUrl: './adding-a-playlist.component.html',
  styleUrls: ['./adding-a-playlist.component.css']
})
export class AddingAPlaylistComponent implements OnInit {

  @ViewChild("autoSongs") autoSongs: ElementRef;

  detailsFormGroup: FormGroup;
  songsFormGroup: FormGroup;
  imageFormGroup: FormGroup;

  songsList: Song[] = [];
  filteredSongs: Observable<Song[]>;
  imageFile: File;
  selectedSongs: Song[] = [];

  constructor(private songService: SongService, private _snackBar: MatSnackBar,
    private playlistService: PlaylistsService, private commonMessage: CommonMessageService) {
    this.detailsFormGroup = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2)]),
      title: new FormControl("", [Validators.required, Validators.minLength(3)])
    });
    this.songsFormGroup = new FormGroup({
      songs: new FormControl("", [Validators.required, Validators.minLength(3)]),
      songControl: new FormControl("")
    });
    this.imageFormGroup = new FormGroup({
      image: new FormControl("", Validators.required)
    });
    this.getSongs();
  }

  ngOnInit(): void {
  }

  getSongs(): void {
    try {
      this.songService.getSongsIncludePerformances()
      .subscribe(songs => {
        this.songsList = songs;
        this.songsList.sort((a, b) => a.name.localeCompare(b.name));
        this.updateSongs();
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  addSong(): void {
    let songName = this.songsFormGroup.controls.songControl.value;
    if (songName != null && songName != "") {
      this.songsList.forEach(song => {
        if (song.name == songName && this.notDuplicate(song)) {
          this.selectedSongs.push(song);
        }
        else if (song.name == songName) {
          this.openSnackBar("השיר שנבחר כבר קיים")
        }
      });
      this.updateSongsControl();
      this.songsFormGroup.controls.songControl.setValue("");
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  notDuplicate(song: Song): boolean {
    return !this.selectedSongs.includes(song);
  }

  clearSong(song : Song): void {
    this.selectedSongs.splice(this.selectedSongs.indexOf(song), 1);
    this.updateSongsControl();
  }

  updateSongsControl(): void {
    this.songsFormGroup.controls.songs.setValue(this.selectedSongs);
  }

  selectImage(fileToUpload: File): void {
    this.imageFile = fileToUpload;
    this.imageFormGroup.controls.image.setValue("for_playlists/" + fileToUpload.name);
  }

  confirm(): void {
    try {
      let pws: playlistWithSongs = new playlistWithSongs();
      pws.playlist = new Playlists;
      pws.playlist.name = this.detailsFormGroup.controls.name.value;
      pws.playlist.title = this.detailsFormGroup.controls.title.value;
      pws.playlist.image = this.detailsFormGroup.controls.image.value;
      pws.songs = [];
      let songs: string[] = [];
      this.selectedSongs.forEach(song => {
        songs.push(song.name);
      });
      pws.songs = songs;
      this.playlistService.addFullPlaylist(pws, this.imageFile)
      .subscribe(res => this.openSnackBar(res ? this.commonMessage.PLAYLIST.ADD.SUCCESS :
        this.commonMessage.PLAYLIST.ADD.FAIL));
    } catch { this.openSnackBar(this.commonMessage.PLAYLIST.ADD.ERROR); }
  }

  public updateSongs(): void {
    this.filteredSongs = this.songsFormGroup.controls.songControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSongs(value))
      );
  }

  public _filterSongs(value: string): Song[] {
    const filterValue = value.toLowerCase();
    return this.songsList.filter(song => song.name.toLowerCase().includes(filterValue));
  }

  getNameErrorMessage(): string {
    let message: string = this.getError(this.detailsFormGroup.controls.name);
    if (message != "") return message;
  }

  getTitleErrorMessage(): string {
    let message: string = this.getError(this.detailsFormGroup.controls.title);
    if (message != "") return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    else if (field.hasError("minlength"))
    return "שם לא תקין.";
    else if (field.hasError("maxLength"))
      return "שם חורג ממגבלת התווים"
    return "";
  }

}
