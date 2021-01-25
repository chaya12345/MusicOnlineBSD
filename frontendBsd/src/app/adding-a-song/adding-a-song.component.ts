import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'adding-a-song',
  templateUrl: './adding-a-song.component.html',
  styleUrls: ['./adding-a-song.component.css']
})
export class AddingASongComponent implements OnInit {

  detailsFormGroup: FormGroup;
  filesFormGroup: FormGroup;

  songFile: File;
  imageFile: File;

  constructor() {
    this.detailsFormGroup = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2)]),
      title: new FormControl("", [Validators.required, Validators.minLength(3)]),
      subtitle: new FormControl("", [Validators.required, Validators.minLength(6)]),
      isPerformance: new FormControl(false),
    });
    this.filesFormGroup = new FormGroup({
      song: new FormControl("", Validators.required),
      image: new FormControl("", Validators.required)
    });
   }

  ngOnInit(): void {
  }

  confirm(): void {

  }

  selectSong(fileToUpload: File): void {
    this.songFile = fileToUpload;
    this.filesFormGroup.controls.song.setValue(this.songFile);
  }

  selectImage(fileToUpload: File): void {
    this.imageFile = fileToUpload;
    this.filesFormGroup.controls.image.setValue(this.imageFile);
  }

  getNameErrorMessage(): string {
    let message: string = this.getError(this.detailsFormGroup.controls.name);
    if (message != "") return message;
  }

  getTitleErrorMessage(): string {
    let message: string = this.getError(this.detailsFormGroup.controls.title);
    if (message != "") return message;
  }

  getSubtitleErrorMessage(): string {
    let message: string = this.getError(this.detailsFormGroup.controls.subtitle);
    if (message != "") return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    else if (field.hasError("minlength"))
    return "שם לא תקין. (מינימום 3-6 תווים בהתאם לסוג השדה)";
    else if (field.hasError("maxLength"))
      return "שם חורג ממגבלת התווים"
    return "";
  }

}
