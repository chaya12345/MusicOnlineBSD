import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { User } from '../classes/user';
import { RegisterToWebsiteComponent } from '../register-to-website/register-to-website.component';
import { DialogDataToWebsite } from '../register/register.component';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'app-register-to-newsletter',
  templateUrl: './register-to-newsletter.component.html',
  styleUrls: ['./register-to-newsletter.component.css']
})
export class RegisterToNewsletterComponent implements OnInit {

  formRegister: FormGroup;
  newUser: User = new User;
  //constructor() { }
  constructor(public dialogRef: MatDialogRef<RegisterToWebsiteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToWebsite,
    private usersService: UsersService) {
    this.formRegister = new FormGroup({
      fullname: new FormControl("", Validators.required),
      email: new FormControl("", Validators.required)
    })
  }

  ngOnInit() {
  }
  onSubmit() {
    if (this.formRegister.valid) {
      this.newUser.name = this.formRegister.controls.fullName.value;
      this.newUser.mail = this.formRegister.controls.email.value;
      this.usersService.RegistrationToNewsleter(this.newUser).subscribe();
      this.onNoClick();
      this.newUser = null;
    }
  }
  onNoClick(): void {
    this.dialogRef.close();
  }
}
