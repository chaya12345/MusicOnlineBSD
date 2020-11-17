import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'parade-header',
  templateUrl: './parade-header.component.html',
  styleUrls: ['./parade-header.component.css']
})
export class ParadeHeaderComponent implements OnInit {

  @Input() imgSurvey: string = "";

  constructor() { }

  ngOnInit(): void {
  }

}
