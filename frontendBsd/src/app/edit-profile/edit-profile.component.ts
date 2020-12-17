import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MatSnackBar } from '@angular/material';
import { User } from '../classes/user';
import { CommonMessageService } from '../services/common-message.service';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'edit-profile',
  templateUrl: './edit-profile.component.html',
  styleUrls: ['./edit-profile.component.css']
})
export class EditProfileComponent implements OnInit {

  formEdit: FormGroup;
  user: User;
  hide: boolean = true;
  check:boolean=false;

  constructor(public dialogRef: MatDialogRef<EditProfileComponent>, private usersService: UsersService,
    private _snackBar: MatSnackBar,private cmService: CommonMessageService) {
    this.user = JSON.parse(sessionStorage.getItem('user'));

    this.formEdit = new FormGroup({
      name: new FormControl(this.user.name, [Validators.required, Validators.minLength(2), Validators.maxLength(50)]),
      email: new FormControl(this.user.mail, [Validators.required, Validators.minLength(2), Validators.maxLength(50), Validators.email]),
      password: new FormControl(this.user.password, [Validators.required, Validators.minLength(2), Validators.maxLength(50),]),
      newsletter: new FormControl(this.user.newsletter)
    });
  }

  ngOnInit(): void {
  }

  onSubmit() {
    try {
      if (this.formEdit.valid) {
        this.user.name = this.formEdit.controls.name.value;
        this.user.mail = this.formEdit.controls.email.value;
        this.user.password = this.formEdit.controls.password.value;
        this.user.newsletter = this.formEdit.controls.newsletter.value;
        this.usersService.updateUserProfil(this.user.id, this.user).subscribe(
          suc => { sessionStorage.removeItem('user'); sessionStorage.setItem('user', JSON.stringify(this.user));
          this.openSnackBar(this.cmService.UPDATE_ITEM.SUCCESS);this.onNoClick(); },
          err =>this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR) );
      }
    } catch (err) {this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR)  }
  }

  onNoClick(): void {
    this.dialogRef.close();
    this.formEdit.reset({ value: "" });
  }

  getNameErrorMessage() {
    if (this.formEdit.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.formEdit.controls.name.hasError("minLength")) {
      return "נדרש מינימום 2 תוים."
    }
    else if (this.formEdit.controls.name.hasError("minLength")) {
      return "מגבלת תוים- מקסימום 50 תוים."
    }
  }

  getEmailErrorMessage() {
    if (this.formEdit.controls.email.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.formEdit.controls.email.hasError("minLength")) {
      return "נדרש מינימום 2 תוים."
    }
    else if (this.formEdit.controls.email.hasError("minLength")) {
      return "מגבלת תוים- מקסימום 50 תוים."
    }
    else if (this.formEdit.controls.email.hasError("email")) {
      return "כתובת מייל לא תקינה."
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
