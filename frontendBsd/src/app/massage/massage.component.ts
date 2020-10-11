import { Component, Inject, Input, OnInit, Output } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

@Component({
  selector: 'app-massage',
  templateUrl: './massage.component.html',
  styleUrls: ['./massage.component.css']
})
export class MassageComponent implements OnInit {

  dialogText: string;

  constructor(public dialogRef: MatDialogRef<MassageComponent>, @Inject(MAT_DIALOG_DATA) public data: MassageComponent) { }

  ngOnInit(): void {
    this.dialogText = this.data.dialogText;
  }

  close(){
    sessionStorage.removeItem('user');
    this.dialogRef.close();
  }

  onNoClick(): void {
    this.dialogRef.close();
  }


}
