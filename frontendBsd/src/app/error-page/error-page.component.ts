import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'error-page',
  templateUrl: './error-page.component.html',
  styleUrls: ['./error-page.component.css']
})
export class ErrorPageComponent implements OnInit {

  @Input() type?: string = "";

  massage: string = "";
  icon: string = "";

  constructor(private router: Router) { }

  ngOnInit() {
    if (this.type == "הרשאה") {
      this.icon = "report_problem";
      this.massage = "אין לך הרשאת גישה!";
    }
    else {
      this.massage = "מצטערים, הניתוב שחיפשת שגוי.";
    }
  }

  backToHome(): void {
    this.router.navigateByUrl("/home");
  }

}
