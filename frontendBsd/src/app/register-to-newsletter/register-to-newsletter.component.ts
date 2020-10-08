import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { User } from '../classes/user';
import { DialogDataToNewletter } from '../register/register.component';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'app-register-to-newsletter',
  templateUrl: './register-to-newsletter.component.html',
  styleUrls: ['./register-to-newsletter.component.css']
})
export class RegisterToNewsletterComponent implements OnInit {

  registerForm: FormGroup;
  newUser: User;

  constructor(public dialogRef: MatDialogRef<RegisterToNewsletterComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToNewletter,
    private usersService: UsersService) {
    this.registerForm = new FormGroup({
      email: new FormControl("", [Validators.required, Validators.email])
    });
  }

  ngOnInit() {
  }

  onSubmit() {
    if (this.registerForm.valid) {
      this.newUser = new User();
      this.newUser.mail = this.registerForm.controls.email.value;
      this.usersService.RegistrationToNewsleter(this.newUser).subscribe();
      this.onNoClick();
      this.newUser = null;
      console.log("register is successfully bsd!!");
      /* TODO send email */
    }
  }
  
  onNoClick(): void {
    this.dialogRef.close();
  }

  getMailErrorMessage() {
    if (this.registerForm.controls.email.hasError("email")) {
      return "כתובת מייל לא חוקית.";
    }
    else if (this.registerForm.controls.email.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }
}
