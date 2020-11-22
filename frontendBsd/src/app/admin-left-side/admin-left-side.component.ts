import { Component, OnInit } from '@angular/core';

export class Info {
  data: string;
  count: number;
}

@Component({
  selector: 'admin-left-side',
  templateUrl: './admin-left-side.component.html',
  styleUrls: ['./admin-left-side.component.css']
})
export class AdminLeftSideComponent implements OnInit {

  name: string = "יעקב כהן";
  mail: string = "yaakov10@gmail.com";
  img: string = "";

  info: Info[];

  constructor() {
    this.info = [{ data: "שירים באתר", count: 315 },
    { data: "כתבות באתר", count: 86 },
    { data: "פלייליסטים באתר", count: 14 },
    { data: "משתמשים", count: 519 },
    { data: "רשומים לניוזלטר", count: 702 }];
  }

  ngOnInit(): void {
  }

}
