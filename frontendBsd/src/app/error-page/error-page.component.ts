import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'error-page',
  templateUrl: './error-page.component.html',
  styleUrls: ['./error-page.component.css']
})
export class ErrorPageComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
  }

  backToHome(): void {
    this.router.navigateByUrl("/home");
  }

}
