import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Artist } from '../classes/artist';
import { ArtistService } from '../services/artist.service';
import { CommonMessageService } from '../services/common-message.service';

@Component({
  selector: 'deleting-artist',
  templateUrl: './deleting-artist.component.html',
  styleUrls: ['./deleting-artist.component.css']
})
export class DeletingArtistComponent implements OnInit {

  @ViewChild("autoArtists") autoArtists: ElementRef;

  selectArtist: FormGroup;
  artistSelected: Artist;
  artistsList: Artist[] = [];
  filteredArtists: Observable<Artist[]>;

  constructor(private artistService: ArtistService, private _snackBar: MatSnackBar, private cmService: CommonMessageService) {
    this.selectArtist = new FormGroup({
      artist: new FormControl("", Validators.required)
    });
    this.getArtists();
  }

  ngOnInit(): void {
  }

  getArtists(): void {
    this.artistService.getArtists().subscribe(
      artists => {
        this.artistsList = artists;
        this.artistsList.sort((a, b) => a.name.localeCompare(b.name));
        this.updateArtistsList();
      }, err => console.log(err));
  }

  selectingArtist(artist: Artist): void {
    this.artistSelected = artist;
  }

  confirm(): void {
    try {
      this.artistService.DeleteArtist(this.artistSelected.id).subscribe(
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
    this.selectArtist.reset({ value: "" });
    this.artistSelected = null;
  }

  updateArtistsList(): void {
    this.filteredArtists = this.selectArtist.controls.artist.valueChanges
      .pipe(
        startWith(''),
        map(value =>this._filterArtists(value)));
  }

  _filterArtists(value: string): Artist[] {
    const filterValue = value.toLocaleLowerCase();
    return this.artistsList.filter(artist=>artist.name.toLocaleLowerCase().includes(filterValue));
  }
}
