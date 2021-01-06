import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'updatings-board',
  templateUrl: './updatings-board.component.html',
  styleUrls: ['./updatings-board.component.css', './../m-style.css']
})
export class UpdatingsBoardComponent implements OnInit {

  updatings = [];
  isUserConnected: boolean = false;

  constructor() { }

  ngOnInit(): void {
  }

}
