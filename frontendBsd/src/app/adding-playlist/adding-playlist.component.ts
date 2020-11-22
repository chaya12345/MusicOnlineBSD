import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { PlaylistSystem } from '../classes/playlistSystem';
import { Song } from '../classes/song';
import { PlaylistsSystemService } from '../services/playlists-system.service';
import { SongService } from '../services/song.service';
import { SongsToPlaylistsSystemService } from '../services/songs-to-playlists-system.service';
import { UploadService } from '../services/upload.service';

@Component({
  selector: 'adding-playlist',
  templateUrl: './adding-playlist.component.html',
  styleUrls: ['./adding-playlist.component.css']
})
export class AddingPlaylistComponent implements OnInit {

  playlistAddingForm: FormGroup;
  songsList: Song[] = [];
  imageFile: File;

  constructor(private songService: SongService, private uploadService: UploadService,
    private songsToPlaylistsSystemService: SongsToPlaylistsSystemService,
    private playlistsSystemService: PlaylistsSystemService) {
    this.playlistAddingForm = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)]),
      title: new FormControl("", [Validators.required, Validators.minLength(3)]),
      image: new FormControl("", Validators.required),
      songs: new FormControl("", Validators.required)
    });
    this.getSongs();
  }

  ngOnInit(): void {
  }

  getSongs() {
    try {
      this.songService.getSongs().subscribe(songs => {
        this.songsList = songs;
        this.songsList.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  onSubmit(): void {
    if (this.playlistAddingForm.valid && this.imageFile != null && this.imageFile != undefined) {
      let newPlaylist: PlaylistSystem = new PlaylistSystem();
      newPlaylist.name = this.playlistAddingForm.controls.name.value;
      newPlaylist.title = this.playlistAddingForm.controls.title.value;
      newPlaylist.image = this.playlistAddingForm.controls.image.value;
      console.log(this.playlistAddingForm.value);
      let songs = this.playlistAddingForm.controls.songs.value;
      console.log(songs);
      try {
      this.playlistsSystemService.addPlaylistSystemWithSongs(newPlaylist, songs).subscribe(res =>
        console.log(res, "Yes"), err => console.log(err));
      } catch (err) { console.log(err); }
    }
  }

  reset() {
    this.playlistAddingForm.reset({ value: "" });
  }

  selectImage(fileToUpload: File): void {
    // const file = files.item(0);
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.playlistAddingForm.controls.image.setValue("for_playlists/" + fileToUpload.name);
    // this.uploadService.postFile(formData).subscribe(
    //   res => console.log(res),
    //   error => console.log(error)
    // );
  }

  saveImage(): void {
    if (this.imageFile != null) {
      this.uploadService.postFile(this.imageFile).subscribe(
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

}
