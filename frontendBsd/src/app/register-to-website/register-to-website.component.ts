import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MatSnackBar, MAT_DIALOG_DATA } from '@angular/material';
import { User } from '../classes/user';
import { DialogDataToWebsite } from '../register/register.component';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'register-to-website',
  templateUrl: './register-to-website.component.html',
  styleUrls: ['./register-to-website.component.css']
})
export class RegisterToWebsiteComponent implements OnInit {

  registerForm: FormGroup;
  user: User;
  success: boolean = false;
  hide: boolean = true;

  constructor(public dialogRef: MatDialogRef<RegisterToWebsiteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToWebsite, private usersService: UsersService,
    private _snackBar: MatSnackBar) {
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
      this.user = new User();
      this.user.name = this.registerForm.controls.name.value;
      this.user.mail = this.registerForm.controls.email.value;
      this.user.password = this.registerForm.controls.password.value;
      try {
        this.usersService.signUp(this.user).subscribe(res => { this.success = res; this.showMessage(); }, err => console.log(err));
      } catch (err) { console.log(err); }
      this.user = null;
      this.onNoClick();
    }
  }

  showMessage(): void {
      console.log("success: " + this.success);
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

  getNameErrorMessage() {
    if (this.registerForm.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }

  getPasswordErrorMessage() {
    if (this.registerForm.controls.password.hasError("required")) {
      return "זהו שדה חובה.";
    }
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
