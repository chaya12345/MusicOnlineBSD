import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Singer } from '../classes/singer';
import { CommonMessageService } from '../services/common-message.service';
import { SingerService } from '../services/singer.service';

@Component({
  selector: 'editing-singer',
  templateUrl: './editing-singer.component.html',
  styleUrls: ['./editing-singer.component.css']
})
export class EditingSingerComponent implements OnInit {

  nameFormGroup: FormGroup;
  imageFormGroup: FormGroup;
  imageFile: File;

  @ViewChild("autoSingers") autoSingers: ElementRef;

  filteredSingers: Observable<Singer[]>;
  singersList: Singer[] = [];

  singerFormGroup: FormGroup;
  selectedSinger: Singer;
  image: string;

  constructor(private singerService: SingerService, private _snackBar: MatSnackBar,
    private commonMessage: CommonMessageService) {
    this.singerFormGroup = new FormGroup({
      singer: new FormControl("", Validators.required)
    });
    this.nameFormGroup = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)])
    });
    this.imageFormGroup = new FormGroup({
      image: new FormControl("", Validators.required)
    });
    this.getSingers();
   }

  ngOnInit(): void {
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  getSingers(): void {
    try {
      this.singerService.getSingers()
        .subscribe(singers => {
          this.singersList = singers;
          this.orderByName(this.singersList);
          this.updateSingersList();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  getSelectedSinger(name: string): void {
    this.singersList.forEach(singer => {
      if (singer.name == name) {
        this.selectedSinger = singer;
        this.nameFormGroup.controls.name.setValue(singer.name);
        this.imageFormGroup.controls.image.setValue(singer.image);
        this.image = "../../assets/images/" + singer.image;
      }
    });
  }

  public updateSingersList(): void {
    this.filteredSingers = this.singerFormGroup.controls.singer.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSingers(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.singersList.filter(singer => singer.name.toLowerCase().includes(filterValue));
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  confirm(): void {
    if (this.singerFormGroup.valid && this.nameFormGroup.valid && this.imageFormGroup.valid) {
      try {
        let updatedSinger: Singer = new Singer;
        updatedSinger = this.selectedSinger;
        updatedSinger.name = this.nameFormGroup.controls.name.value;
        updatedSinger.image = this.imageFormGroup.controls.image.value;
        this.singerService.updateSinger(updatedSinger)
        .subscribe(res => this.openSnackBar(res ? this.commonMessage.UPDATE_ITEM.SUCCESS :
          this.commonMessage.UPDATE_ITEM.ERROR),
          () => this.openSnackBar(this.commonMessage.UPDATE_ITEM.ERROR));
      } catch { this.openSnackBar(this.commonMessage.UPDATE_ITEM.ERROR); }
    }
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.imageFormGroup.controls.image.setValue("singers/" + fileToUpload.name);
    console.log(this.imageFormGroup.controls.image.value);
  }

  getSingerErrorMessage(): string {
    let message: string = this.getError(this.singerFormGroup.controls.singer);
    if (message != "") return message;
  }

  getNameErrorMessage(): string {
    let message: string = this.getError(this.nameFormGroup.controls.name);
    if (message != "") return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    else if (field.hasError("minlength"))
      return "שם לא תקין. (מינימום 3 תווים)";
    else if (field.hasError("maxLength"))
      return "שם חורג ממגבלת התווים"
    return "";
  }

}
