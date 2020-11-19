import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'priv-info',
  templateUrl: './priv-info.component.html',
  styleUrls: ['./priv-info.component.css']
})
export class PrivInfoComponent implements OnInit {

  name: string = "איציק לוי";
  mail: string = "Itzik.levi@gmail.com";
  subsCount: number = 2;
  songsInFollowUp: number = 4;
  articlesInFollowUp: number = 6;

  constructor() { }

  ngOnInit(): void {
  }

}
