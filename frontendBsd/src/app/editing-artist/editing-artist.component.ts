import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Artist } from '../classes/artist';
import { ArtistService } from '../services/artist.service';
import { CommonMessageService } from '../services/common-message.service';

@Component({
  selector: 'editing-artist',
  templateUrl: './editing-artist.component.html',
  styleUrls: ['./editing-artist.component.css']
})
export class EditingArtistComponent implements OnInit {

  selectArtist: FormGroup;
  artistsList: Artist[] = [];
  filteredArtists: Observable<Artist[]>;
  editArtist: FormGroup;
  selectedArtist: Artist;

  constructor(private artistService: ArtistService, private _snackBar: MatSnackBar, private cmService: CommonMessageService) {
    this.selectArtist = new FormGroup({
      artist: new FormControl("", Validators.required)
    });
    try {
      this.artistService.getArtists().subscribe(
        artists => { this.artistsList = artists; this.orderByName(this.artistsList); this.updateArtistsList(); },
        err => console.log(err));
    } catch (err) { console.log(err) }
    this.editArtist = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)])
    });
  }

  ngOnInit(): void {
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  public updateArtistsList(): void {
    this.filteredArtists = this.selectArtist.controls.artist.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterArtists(value))
      );
  }

  public _filterArtists(value: string): Artist[] {
    const filterValue = value.toLowerCase();
    return this.artistsList.filter(artist => artist.name.toLowerCase().includes(filterValue));
  }

  selectingArtist(artist: Artist) {
    this.selectedArtist = artist;
    this.selectArtist.controls.artist.setValue(artist);
    this.editArtist.controls.name.setValue(artist.name);
  }

  getNameErrorMessage() {
    if (this.editArtist.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.editArtist.controls.name.hasError("minlength")) {
      return "שם לא תקין. (מינימום 3 תווים)"
    }
  }

  confirm(): void {
    if (this.editArtist.valid) {
      this.selectedArtist.name = this.editArtist.controls.name.value;
      this.artistService.updateArtist(this.selectedArtist).subscribe(
        suc => this.openSnackBar(this.cmService.UPDATE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR));
      this.reset();
    }
  }

  reset(): void {
    this.editArtist.reset({ value: "" });
    this.selectArtist.reset({ value: "" });
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000
    });
  }

}
