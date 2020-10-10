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

  registerForm: FormGroup

  constructor(public dialogRef: MatDialogRef<RegisterToWebsiteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToWebsite) {
      this.registerForm = new FormGroup({
        name: new FormControl("", [Validators.required, Validators.minLength(2)]),
        email: new FormControl("", [Validators.required, Validators.email]),
        password: new FormControl("", Validators.required)
      });
    }

  ngOnInit() {
  }

  onSubmit(): void {
    if (this.registerForm.valid) {
      
    }
  }
  
  onNoClick(): void {
    this.dialogRef.close();
  }

}
