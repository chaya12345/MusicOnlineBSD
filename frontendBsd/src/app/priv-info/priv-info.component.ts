import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'priv-info',
  templateUrl: './priv-info.component.html',
  styleUrls: ['./priv-info.component.css']
})
export class PrivInfoComponent implements OnInit {

  @Input() name: string = "";
  @Input() mail: string = "";
  @Input() img: string = "";
  subsCount: number = 2;
  songsInFollowUp: number = 4;
  articlesInFollowUp: number = 6;

  constructor() { }

  ngOnInit(): void {
  }

}
