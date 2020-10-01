import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'magazine',
  templateUrl: './magazine.component.html',
  styleUrls: ['./magazine.component.css']
})
export class MagazineComponent implements OnInit {

  navs: string[] = [];

  constructor() {
    this.navs.push("מגזין");
  }

  ngOnInit() {
  }

}
