import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MatSnackBar, MAT_DIALOG_DATA } from '@angular/material';
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
  success: boolean;

  constructor(public dialogRef: MatDialogRef<RegisterToNewsletterComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToNewletter,
    private usersService: UsersService, private _snackBar: MatSnackBar) {
    this.registerForm = new FormGroup({
      email: new FormControl("", [Validators.required, Validators.email])
    });
  }

  ngOnInit() {
  }

  onSubmit() {
    if (this.registerForm.valid) {
      try {
      this.usersService.RegistrationToNewsleter(this.registerForm.controls.email.value)
      .subscribe(res => { this.success = res; this.showMessage(); }, err => console.log(err));
      } catch (err) { console.log(err); }
      this.onNoClick();
      /* TODO send email */
    }
  }

  showMessage(): void {
    if (this.success == true) {
      this.openSnackBar('נרשמת בהצלחה');
    }
    else {
      this.openSnackBar('כתובת המייל שהוזנה כבר רשומה');
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

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
