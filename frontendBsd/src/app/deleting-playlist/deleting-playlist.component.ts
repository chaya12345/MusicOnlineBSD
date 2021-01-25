import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Playlists } from '../classes/playlists';
import { CommonMessageService } from '../services/common-message.service';
import { PlaylistsService } from '../services/playlists.service';

@Component({
  selector: 'deleting-playlist',
  templateUrl: './deleting-playlist.component.html',
  styleUrls: ['./deleting-playlist.component.css']
})
export class DeletingPlaylistComponent implements OnInit {
  
  playlistFormGroup: FormGroup;
  playlistsList: Playlists[] = [];
  filteredPlaylists: Observable<Playlists[]>;
  selectedPlaylist: Playlists;

  constructor(private playlistService: PlaylistsService, private cmService: CommonMessageService,
    private _snackBar: MatSnackBar) {
    this.playlistFormGroup = new FormGroup({
      playlist: new FormControl("", Validators.required)
    });
    this.getPlaylists();
  }

  ngOnInit(): void {
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

  updateSelectedPlaylist(playlist: Playlists): void {
    this.selectedPlaylist = playlist;
  }

  confirm(): void {
    try {
      this.playlistService.deletePlayList(this.selectedPlaylist.id).subscribe(
        suc => this.openSnackBar(suc == true ? this.cmService.DELETE_ITEM.SUCCESS : this.cmService.DELETE_ITEM.FAIL),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  openSnackBar(message: string): void {
    this._snackBar.open(message, '', {
      duration: 2000
    });
  }

  reset(): void {
    this.playlistFormGroup.reset({ value: "" });
    this.selectedPlaylist = null;
  }

}
