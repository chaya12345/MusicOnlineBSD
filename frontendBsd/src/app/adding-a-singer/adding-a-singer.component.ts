import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'adding-a-singer',
  templateUrl: './adding-a-singer.component.html',
  styleUrls: ['./adding-a-singer.component.css']
})
export class AddingASingerComponent implements OnInit {

  nameFormGroup: FormGroup;
  imageFormGroup: FormGroup;
  imageFile: File;

  constructor() {
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
    this.imageFormGroup.controls.image.setValue("for_songs/" + fileToUpload.name);
  }

}
