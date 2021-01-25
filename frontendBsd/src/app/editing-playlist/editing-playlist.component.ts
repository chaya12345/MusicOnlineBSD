import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormControl, Validators, AbstractControl } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { startWith, map } from 'rxjs/operators';
import { Playlists } from '../classes/playlists';
import { Song } from '../classes/song';
import { CommonMessageService } from '../services/common-message.service';
import { PlaylistsService, playlistWithSongs } from '../services/playlists.service';
import { SongService } from '../services/song.service';
import { SongsToPlaylistsSystemService } from '../services/songs-to-playlists-system.service';

@Component({
  selector: 'editing-playlist',
  templateUrl: './editing-playlist.component.html',
  styleUrls: ['./editing-playlist.component.css']
})
export class EditingPlaylistComponent implements OnInit {

  @ViewChild("autoPlaylists") autoPlaylists: ElementRef;
  @ViewChild("autoSongs") autoSongs: ElementRef;

  playlistFormGroup: FormGroup;
  detailsFormGroup: FormGroup;
  songsFormGroup: FormGroup;
  imageFormGroup: FormGroup;

  songsList: Song[] = [];
  filteredSongs: Observable<Song[]>;
  imageFile: File;
  selectedSongs: Song[] = [];

  playlistsList: Playlists[] = [];
  filteredPlaylists: Observable<Playlists[]>;
  selectedPlaylist: Playlists;
  image: string;

  constructor(private songService: SongService, private _snackBar: MatSnackBar,
    private playlistService: PlaylistsService, private commonMessage: CommonMessageService,
    private stpService: SongsToPlaylistsSystemService) {
    this.playlistFormGroup = new FormGroup({
      playlist: new FormControl("", Validators.required)
    });
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
    this.getPlaylists();
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

  getPlaylists(): void {
    try {
      this.playlistService.getPlaylists()
        .subscribe(playlists => {
          this.playlistsList = playlists;
          this.playlistsList.sort((a, b) => a.name.localeCompare(b.name));
          console.log(this.playlistsList);
          this.updatePlaylists();
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getSelectedPlaylist(name: string): void {
    this.playlistsList.forEach(playlist => {
      if (playlist.name == name) {
        this.selectedPlaylist = playlist;
      }
    });
    this.detailsFormGroup.controls.name.setValue(this.selectedPlaylist.name);
    this.detailsFormGroup.controls.title.setValue(this.selectedPlaylist.title);
    this.imageFormGroup.controls.image.setValue(this.selectedPlaylist.image);
    this.image = "../../assets/images/" + this.selectedPlaylist.image;
    try {
      this.stpService.getSongsToPlaylistSystem(this.selectedPlaylist.id)
      .subscribe(songs => {
        this.selectedSongs = songs;
        this.updateSongsControl();
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

  clearSong(song: Song): void {
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
      pws.playlist = new Playlists();
      pws.playlist.id = this.selectedPlaylist.id;
      pws.playlist.name = this.detailsFormGroup.controls.name.value;
      pws.playlist.title = this.detailsFormGroup.controls.title.value;
      pws.playlist.image = this.detailsFormGroup.controls.image.value;
      pws.songs = [];
      let songs: string[] = [];
      this.selectedSongs.forEach(song => {
        songs.push(song.name);
      });
      pws.songs = songs;
      this.playlistService.addFullPlaylist(pws, this.imageFile, true)
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

  public updatePlaylists(): void {
    this.filteredPlaylists = this.playlistFormGroup.controls.playlist.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterPlaylists(value))
      );
  }

  public _filterPlaylists(value: string): Playlists[] {
    const filterValue = value.toLowerCase();
    return this.playlistsList.filter(playlist => playlist.name.toLowerCase().includes(filterValue));
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
