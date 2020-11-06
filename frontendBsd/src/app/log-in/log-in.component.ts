import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { User } from '../classes/user';
import { RegisterToWebsiteComponent } from '../register-to-website/register-to-website.component';
import { DialogDataToWebsite } from '../register/register.component';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'app-log-in',
  templateUrl: './log-in.component.html',
  styleUrls: ['./log-in.component.css']
})
export class LogInComponent implements OnInit {

  hide = true;
  formLogIn: FormGroup;
  name: string;
  password: string;

  constructor(public dialogRef: MatDialogRef<LogInComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToWebsite, private usersService: UsersService,
    public dialog: MatDialog) {
    this.formLogIn = new FormGroup({
      name: new FormControl("", [Validators.required]),
      password: new FormControl("", [Validators.required])
    });
  }

  ngOnInit(): void {
  }

  onSubmit() {
    if (this.formLogIn.valid) {
      this.name = this.formLogIn.controls.name.value;
      this.password = this.formLogIn.controls.password.value;
      let manager = this.usersService.logInManager(this.name, this.password);
      if (manager != null) {
        sessionStorage.setItem('manager', manager.id.toString());
      }
      else {
        this.usersService.logIn(this.name, this.password)
          .subscribe(user => {//חובה לבדוק שהוא אכן מצא משתמש כזה, כי גם אם הוא לא מצא הקריאה עדיין הצליחה
            if (user != null || user != undefined) {
              sessionStorage.setItem('user', JSON.stringify(user));
            }
          }
            , err => console.log(err));
      }
      this.onNoClick();
    }
  }

  onNoClick(): void {
    this.dialogRef.close();
    this.formLogIn.reset({ value: "" });
  }

  openRegisterDialog() {
    try {
      this.onNoClick();
      const dialogRef = this.dialog.open(RegisterToWebsiteComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => {
      });
    } catch (err) { console.log(err); }
  }
  getNameErrorMessage() {
    if (this.formLogIn.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }
  getPasswordErrorMessage() {
    if (this.formLogIn.controls.password.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }
}
