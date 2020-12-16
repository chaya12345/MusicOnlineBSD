import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { MatSnackBar } from '@angular/material';
import { Playlists } from '../classes/playlists';
import { Song } from '../classes/song';
import { PlaylistsService } from '../services/playlists.service';
import { SongService } from '../services/song.service';
import { SongsToPlaylistsSystemService } from '../services/songs-to-playlists-system.service';
import { UploadService } from '../services/upload.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'adding-playlist',
  templateUrl: './adding-playlist.component.html',
  styleUrls: ['./adding-playlist.component.css']
})
export class AddingPlaylistComponent implements OnInit {

  playlistAddingForm: FormGroup;
  songsList: Song[] = [];
  imageFile: File;
  
  filteredPlaylists: Observable<Playlists[]>;
  playlists: Playlists[] = [];
  playlistControl = new FormControl();
  SelectedPlaylist: Playlists;

  isEdit: boolean = false;

  constructor(private songService: SongService, private uploadService: UploadService,
    private songsToPlaylistsSystemService: SongsToPlaylistsSystemService,
    private playlistsService: PlaylistsService, private _snackBar: MatSnackBar,
    private playlistService: PlaylistsService) {
    this.playlistAddingForm = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)]),
      title: new FormControl("", [Validators.required, Validators.minLength(3)]),
      image: new FormControl("", Validators.required),
      songs: new FormControl("", Validators.required)
    });
    this.getSongs();
    this.getPlaylists();
    this.playlistControl = new FormControl();
  }

  ngOnInit(): void {
  }

  getPlaylists(): void {
    try {
      this.playlistService.getPlaylists()
        .subscribe(playlists => { 
          this.playlists = playlists;
          this.orderByName(this.songsList);
          this.updatePlaylists();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  getSongs() {
    try {
      this.songService.getSongs().subscribe(songs => {
        this.songsList = songs;
        this.songsList.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  onSelectionChange(event): void {
    console.log(event.option.value);
    try {
      this.playlistService.GetPlaylistByName(event.option.value)
      .subscribe(playlist => {
        this.SelectedPlaylist = playlist;
        console.log(this.SelectedPlaylist);
        this.enteringValues();
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }

  enteringValues(): void {
    if (this.isEdit == true && this.SelectedPlaylist != null) {
      this.playlistAddingForm.controls.name.setValue(this.SelectedPlaylist.name);
      this.playlistAddingForm.controls.title.setValue(this.SelectedPlaylist.title);
      this.playlistAddingForm.controls.image.setValue(this.SelectedPlaylist.image);
      // this.playlistAddingForm.controls.songs.setValue(this.SelectedPlaylist.name);
    }
  }

  onSubmit(): void {
    if (this.playlistAddingForm.valid && this.imageFile != null && this.imageFile != undefined) {
      let newPlaylist: Playlists = new Playlists();
      newPlaylist.name = this.playlistAddingForm.controls.name.value;
      newPlaylist.title = this.playlistAddingForm.controls.title.value;
      newPlaylist.image = this.playlistAddingForm.controls.image.value;
      let songs = this.playlistAddingForm.controls.songs.value;
      try {
      this.playlistsService.addPlaylistWithSongs(newPlaylist, songs).subscribe(res =>
        {
          console.log(res, "Yes");
          this.saveImage(this.imageFile);
        }, err => console.log(err));
      } catch (err) { console.log(err); }
      this.reset();
      this.openSnackBar("הוספת הפלייליסט בוצעה בהצלחה");
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  reset() {
    this.playlistAddingForm.reset({ value: "" });
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.playlistAddingForm.controls.image.setValue("for_playlists/" + fileToUpload.name);
  }

  saveImage(fileToUpload: File): void {
    if (fileToUpload != null) {
      this.uploadService.postFile([fileToUpload], "images//for_playlists").subscribe(
        res => console.log(res),
        error => console.log(error)
      );
    }
  }

  getNameErrorMessage() {
    if (this.playlistAddingForm.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.playlistAddingForm.controls.name.hasError("minlength")) {
      return "שם לא תקין. (פחות מ-3 תווים)"
    }
  }

  getTitleErrorMessage() {
    if (this.playlistAddingForm.controls.title.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.playlistAddingForm.controls.title.hasError("minlength")) {
      return "שם לא תקין. (פחות מ-3 תווים)"
    }
  }

  public updatePlaylists(): void {
    this.filteredPlaylists = this.playlistControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterPlaylists(value))
      );
  }

  public _filterPlaylists(value: string): Playlists[] {
    const filterValue = value.toLowerCase();
    return this.playlists.filter(playlist => playlist.name.toLowerCase().includes(filterValue));
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

}
