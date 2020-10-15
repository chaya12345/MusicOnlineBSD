import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

@Component({
  selector: 'app-message',
  templateUrl: './message.component.html',
  styleUrls: ['./message.component.css']
})
export class MessageComponent implements OnInit {

  dialogText: string;

  constructor(public dialogRef: MatDialogRef<MessageComponent>, 
    @Inject(MAT_DIALOG_DATA) public data: MessageComponent) { }

  ngOnInit(): void {
    this.dialogText = this.data.dialogText;
  }

  close(){
    this.dialogRef.close(true);
  }

  onNoClick(): void {
    this.dialogRef.close(false);
  }


}
