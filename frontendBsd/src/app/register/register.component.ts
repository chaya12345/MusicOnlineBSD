import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  @Input() type: string;
  text: string;
  buttonText: string;

  constructor() { }

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

}
