import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Artist } from '../classes/artist';
import { MessageComponent } from '../message/message.component';
import { ArtistService } from '../services/artist.service';
import { CommonMessageService } from '../services/common-message.service';

@Component({
  selector: 'adding-artist',
  templateUrl: './adding-artist.component.html',
  styleUrls: ['./adding-artist.component.css', './../admin-style.css']
})
export class AddingArtistComponent implements OnInit {

  artistAddingForm: FormGroup;
  isEdit: boolean = false;
  
  filteredArtists: Observable<Artist[]>;
  artists: Artist[] = [];
  artistControl = new FormControl();
  SelectedArtist: Artist;

  constructor(private artistService: ArtistService,private dialog: MatDialog,
    private _snackBar: MatSnackBar, private cmService: CommonMessageService) {
    this.artistAddingForm = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)])
    });
    this.getArtists();
   }

  ngOnInit(): void {
  }

  onSubmit(): void {
    if (this.artistAddingForm.valid && this.isEdit == false) {
      let newArtist: Artist = new Artist;
      newArtist.name = this.artistAddingForm.controls.name.value;
      try {
        this.artistService.addArtist(newArtist).subscribe(res => {
          this.openSnackBar(this.cmService.GENERATE.ADD.SUCCESS);
        }, () => this.openSnackBar(this.cmService.GENERATE.ADD.ERROR));
      } catch { this.openSnackBar(this.cmService.GENERATE.ADD.ERROR); }
      this.reset();
    }
  }

  reset() {
    this.artistAddingForm.reset({ value: "" });
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.saveChanges();
      });
    } catch (err) { console.log(err); }
  }

  saveChanges(): void {
    if (this.artistAddingForm.valid == false)
      return;
    try {
      let artist = new Artist;
      artist.id = this.SelectedArtist.id;
      artist.name = this.artistAddingForm.controls.name.value;
      this.artistService.updateArtist(artist)
      .subscribe(res => {
        this.openSnackBar(res == true ? this.cmService.UPDATE_ITEM.SUCCESS :
          this.cmService.UPDATE_ITEM.FAIL);
      }, () => this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR));
    } catch { this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR); }
  }

  public updateArtist(): void {
    this.filteredArtists = this.artistControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterPlaylists(value))
      );
  }

  public _filterPlaylists(value: string): Artist[] {
    const filterValue = value.toLowerCase();
    return this.artists.filter(playlist => playlist.name.toLowerCase().includes(filterValue));
  }

  onSelectionChange(event): void {
    this.artists.forEach(artist => {
      if (artist.name == event.option.value) {
        this.SelectedArtist = artist;
      }
    });
    this.artistAddingForm.controls.name.setValue(this.SelectedArtist.name);
  }

  getArtists(): void {
    try {
      this.artistService.getArtists()
      .subscribe(artists => {
        this.artists = artists;
        this.artists.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getNameErrorMessage() {

  }
}
