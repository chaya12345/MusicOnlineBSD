import { Component, Input, OnInit, Output } from '@angular/core';
import { MatDialogRef } from '@angular/material';

@Component({
  selector: 'app-massage',
  templateUrl: './massage.component.html',
  styleUrls: ['./massage.component.css']
})
export class MassageComponent implements OnInit {

  @Input() massage:string;
  constructor(public dialogRef: MatDialogRef<MassageComponent>) { }

  ngOnInit(): void {
  }
  close(){
    sessionStorage.removeItem('user');
    this.dialogRef.close();
    
  }
  onNoClick(): void {
    this.dialogRef.close();
  }


}
