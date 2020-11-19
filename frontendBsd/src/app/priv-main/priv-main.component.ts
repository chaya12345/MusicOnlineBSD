import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'priv-main',
  templateUrl: './priv-main.component.html',
  styleUrls: ['./priv-main.component.css']
})
export class PrivMainComponent implements OnInit {

  date: Date = new Date("01-12-2020 21:05");

  constructor() { }

  ngOnInit(): void {
  }

}
