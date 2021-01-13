import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';

@Component({
  selector: 'adding-a-singer',
  templateUrl: './adding-a-singer.component.html',
  styleUrls: ['./adding-a-singer.component.css']
})
export class AddingASingerComponent implements OnInit {

  nameFormGroup: FormGroup;
  imageFormGroup: FormGroup;
  imageFile: File;

  constructor(private singerService: SingerService) {
    this.nameFormGroup = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)])
    });
    this.imageFormGroup = new FormGroup({
      image: new FormControl("", Validators.required)
    });
  }

  ngOnInit(): void {
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.imageFormGroup.controls.image.setValue("singers/" + fileToUpload.name);
    console.log(this.imageFormGroup.controls.image.value);
  }

  confirm() {
    if (this.nameFormGroup.valid && this.imageFormGroup.valid) {
      try {
        let singer: Singer = new Singer();
        singer.name = this.nameFormGroup.controls.name.value;
        singer.image = this.imageFormGroup.controls.image.value;
        this.singerService.addSingerWithSavingImg(singer, this.imageFile)
        .subscribe();
      } catch (err) { console.log(err); }
    }
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
