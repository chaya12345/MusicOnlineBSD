import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogDataToWebsite } from '../registration/registration.component';

@Component({
  selector: 'registration-to-website',
  templateUrl: './registration-to-website.component.html',
  styleUrls: ['./registration-to-website.component.css']
})
export class RegistrationToWebsiteComponent implements OnInit {

  constructor(public dialogRef: MatDialogRef<RegistrationToWebsiteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogDataToWebsite) { }

  ngOnInit() {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
