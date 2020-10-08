import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { DialogDataToWebsite } from '../register/register.component';

@Component({
  selector: 'register-to-website',
  templateUrl: './register-to-website.component.html',
  styleUrls: ['./register-to-website.component.css']
})
export class RegisterToWebsiteComponent implements OnInit {

  constructor(public dialogRef: MatDialogRef<RegisterToWebsiteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToWebsite) { }

  ngOnInit() {
  }
  
  onNoClick(): void {
    this.dialogRef.close();
  }

}
