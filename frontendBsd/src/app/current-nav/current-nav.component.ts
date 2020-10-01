import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'current-nav',
  templateUrl: './current-nav.component.html',
  styleUrls: ['./current-nav.component.css']
})
export class CurrentNavComponent implements OnInit {

  @Input() navs?: string[] = [];

  constructor(private router: Router) {
  }

  ngOnInit() {
    this.navs.reverse();
    this.navs.push("ראשי");
    this.navs.reverse();
  }

  navigate(event): void {
    if (event.target.innerHTML.includes("ראשי")) {
      this.router.navigateByUrl("home");
    }
    else if (event.target.innerHTML.includes("חדש במוזיקה")) {
      this.router.navigateByUrl("song");
    }
    else if (event.target.innerHTML.includes("מגזין")) {
      this.router.navigateByUrl("magazine");
    }
  }

}
