import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { RegisterToNewsletterComponent } from '../register-to-newsletter/register-to-newsletter.component';
import { RegisterToWebsiteComponent } from '../register-to-website/register-to-website.component';

export interface DialogDataToNewletter {
  mail: string;
}

export interface DialogDataToWebsite {
  name: string;
  mail: string;
  password: string;
}

@Component({
  selector: 'register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  name: string;
  mail: string;
  password: string;

  @Input() type: string;
  text: string;
  buttonText: string;

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
    if (this.type == "website") {
      this.text = "הצטרפו עכשיו למיוזיק אונליין.";
      this.buttonText = "הרשמה";
    }
    else if (this.type == "newsletter") {
      this.text = "הרשמו לניוזלטר ותהיו מעודכנים.";
      this.buttonText = "הרשמה לניוזלטר";
    }
  }

  openDialog(): void {
    if (this.type == "website")
      this.openDialogToWebsite();
    else if (this.type == "newsletter")
      this.openDialogToNewsletter();
  }

  openDialogToWebsite(): void {
    try {
      const dialogRef = this.dialog.open(RegisterToWebsiteComponent, {
        width: '400px',
        data: { }
      });
      dialogRef.afterClosed().subscribe(result => {
      });
    }
    catch (err) { console.log(err); }
  }

  openDialogToNewsletter(): void {
    try {
      const dialogRef = this.dialog.open(RegisterToNewsletterComponent, {
        width: '400px',
        data: { }
      });
      dialogRef.afterClosed().subscribe(result => {
      });
    }
    catch (err) { console.log(err); }
  }

}
