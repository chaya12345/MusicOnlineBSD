import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  href: string = "";
  
  constructor(public router: Router) { }

  ngOnInit() {
    this.href = this.router.url;
  }

}
