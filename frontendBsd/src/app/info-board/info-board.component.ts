import { Component, Input, OnInit } from '@angular/core';
import { Info } from '../admin-left-side/admin-left-side.component';

@Component({
  selector: 'info-board',
  templateUrl: './info-board.component.html',
  styleUrls: ['./info-board.component.css']
})
export class InfoBoardComponent implements OnInit {

  @Input() info: Info[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
