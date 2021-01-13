import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Artist } from '../classes/artist';
import { ArtistService } from '../services/artist.service';
import { CommonMessageService } from '../services/common-message.service';

@Component({
  selector: 'adding-a-artist',
  templateUrl: './adding-a-artist.component.html',
  styleUrls: ['./adding-a-artist.component.css']
})
export class AddingAArtistComponent implements OnInit {

  artistDetails: FormGroup;

  constructor(private artistService: ArtistService,  private _snackBar: MatSnackBar, private cmService: CommonMessageService) {
    this.artistDetails = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)])
    })
  }

  ngOnInit(): void {
  }

  getNameErrorMessage() {
    if (this.artistDetails.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.artistDetails.controls.name.hasError("minlength")) {
      return "שם לא תקין. (פחות מ-3 תווים)"
    }
  }
  
  onSubmit(): void {
    try {
      if (this.artistDetails.valid) {
        let artist: Artist = new Artist;
        artist.name = this.artistDetails.controls.name.value;
        this.artistService.addArtist(artist).subscribe(suc=>
          this.openSnackBar(suc==true?this.cmService.GENERATE.ADD.SUCCESS:this.cmService.GENERATE.ADD.FAIL),
          err=> this.openSnackBar(this.cmService.GENERATE.ADD.ERROR))}
    } catch (err) { console.log(err) }
    this.reset();
  }
  
  reset() {
    this.artistDetails.reset({ value: "" });
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
