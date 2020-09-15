import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { RegisterToWebsiteComponent } from '../register-to-website/register-to-website.component';

export interface DialogDataToWebsite {
  animal: string;
  name: string;
  password: string;
  isNewsletter: boolean;
}


@Component({
  selector: 'register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  
  fullname: string;
  email: string;
  password: string;
  isNewsletterWanted: boolean;

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
  
  openDialogToWebsite(): void {
    try {
      const dialogRef = this.dialog.open(RegisterToWebsiteComponent, {
        width: '400px',
        data: { fullname: this.fullname, email: this.email, password: this.password, isNewsletterWanted: this.isNewsletterWanted }
      });
      dialogRef.afterClosed().subscribe(result => {
        if(result!=null){
          this.fullname = result.slice(0, result.indexOf('|'));
        this.email = result.slice(result.indexOf('|') + 1, result.length);
        }
        
      });
    }
    catch { console.log('register'); }
  }

}
