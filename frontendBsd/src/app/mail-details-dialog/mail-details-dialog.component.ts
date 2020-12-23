import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA, MatSnackBar } from '@angular/material';
import { MailDetails } from '../services/upload.service';
import { DialogData } from '../uploading-song/uploading-song.component';

@Component({
  selector: 'app-mail-details-dialog',
  templateUrl: './mail-details-dialog.component.html',
  styleUrls: ['./mail-details-dialog.component.css']
})
export class MailDetailsDialogComponent implements OnInit {


  detailsMailForm: FormGroup;
  hide:boolean=true;

  constructor(public dialogRef: MatDialogRef<MailDetailsDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private _snackBar: MatSnackBar) { 
      this.detailsMailForm=new FormGroup({
        usernName:new FormControl("",[Validators.required,Validators.minLength(14)]),
        password:new FormControl("",[Validators.required,Validators.minLength(6)])
      });
    }

  ngOnInit(): void {
  }
  
  onNoClick(): void {
    this.detailsMailForm.reset({ value: "" });
    this.dialogRef.close();
  }

  onSubmit(): void {
    if(this.detailsMailForm.valid){
     let mailDetails:MailDetails=new MailDetails;
     mailDetails.username=this.detailsMailForm.controls.userName.value;
     mailDetails.password=this.detailsMailForm.controls.password.value;
     this.detailsMailForm.reset({ value: "" });
     //this.dialogRef.close(mailDetails);‏
    }
  }

  getUserNameErrorMessage(){
    if (this.detailsMailForm.controls.usernName.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.detailsMailForm.controls.name.hasError("minlength")) {
      return "שם משתמש לא תקין. (פחות מ-14 תווים)"
    }
  }
  getPasswordErrorMessage(){
    if (this.detailsMailForm.controls.password.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.detailsMailForm.controls.password.hasError("minlength")) {
      return "סיסמא לא תקינה. (פחות מ-6 תווים)"
    }
  }

}
