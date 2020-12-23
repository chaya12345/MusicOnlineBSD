import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA, MatSnackBar } from '@angular/material';
import { DialogData } from '../uploading-song/uploading-song.component';

@Component({
  selector: 'app-mail-details-dialog',
  templateUrl: './mail-details-dialog.component.html',
  styleUrls: ['./mail-details-dialog.component.css']
})
export class MailDetailsDialogComponent implements OnInit {


  detailsMailForm: FormGroup;

  constructor(public dialogRef: MatDialogRef<MailDetailsDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private _snackBar: MatSnackBar) { }

  ngOnInit(): void {
  }
  
  onNoClick(): void {
    this.dialogRef.close();
  }

  onSubmit(): void {

  }

}
