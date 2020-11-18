import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

export enum Type {
  email,
  name,
  singers
}

@Component({
  selector: 'field-form',
  templateUrl: './field-form.component.html',
  styleUrls: ['./field-form.component.css']
})

export class FieldFormComponent implements OnInit {

  message: string = "";
  type: Type;
  email: FormControl = new FormControl("", [Validators.required, Validators.email]);
  name: FormControl = new FormControl("", [Validators.required, Validators.minLength(2)]);

  constructor(public dialogRef: MatDialogRef<FieldFormComponent>,
    @Inject(MAT_DIALOG_DATA) public data: FieldFormComponent, public dialog: MatDialog) { }

  ngOnInit(): void {
    this.message = this.data.message;
    this.type = this.data.type;
  }

  onNoClick(): void {
    this.dialogRef.close();
    this.email.reset({ value: "" });
    this.name.reset({ value: "" });
  }

  onSubmit(): void {
    if (this.type == Type.email && this.email.valid) {
      this.dialogRef.close(this.email.value);
    }
    else if (this.type == Type.name && this.name.valid) {
      this.dialogRef.close(this.name.value);
    }
    else if (this.type == Type.singers) {

    }
  }

  getMailErrorMessage() {
    if (this.email.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.email.hasError("email")) {
      return "כתובת מייל לא תקינה.";
    }
  }
  
  getNameErrorMessage() {
    if (this.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }

}
