import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { RegistrationToNewsletterComponent } from '../registration-to-newsletter/registration-to-newsletter.component';
import { RegistrationToWebsiteComponent } from '../registration-to-website/registration-to-website.component';

export interface DialogDataToNewsletter {
  animal: string;
  name: string;
}

export interface DialogDataToWebsite {
  animal: string;
  name: string;
  password: string;
  isNewsletter: boolean;
}

@Component({
  selector: 'registration',
  templateUrl: './Registration.component.html',
  styleUrls: ['./Registration.component.css']
})
export class RegistrationComponent implements OnInit {

  fullname: string;
  email: string;
  password: string;
  isNewsletterWanted: boolean;

  constructor(public dialog: MatDialog) { }

  ngOnInit() {
  }


  openDialogToWebsite(): void {
    try {
      const dialogRef = this.dialog.open(RegistrationToWebsiteComponent, {
        width: '400px',
        data: { fullname: this.fullname, email: this.email, password: this.password, isNewsletterWanted: this.isNewsletterWanted }
      });
      dialogRef.afterClosed().subscribe(result => {
        console.log('The dialog was closed');
        this.fullname = result.slice(0, result.indexOf('|'));
        this.email = result.slice(result.indexOf('|') + 1, result.length);
        console.log("res: " + this.fullname + " l; " + this.email);
      });
    }
    catch { console.log('registration'); }
  }

  openDialogToNewsletter(): void {
    try {
    const dialogRef = this.dialog.open(RegistrationToNewsletterComponent, {
      width: '400px',
      data: { fullname: this.fullname, email: this.email }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.fullname = result.slice(0, result.indexOf('|'));
      this.email = result.slice(result.indexOf('|') + 1, result.length);
      console.log("res: " + this.fullname + " l; " + this.email);
    });
  }
  catch { console.log('registration'); }
  }

}
