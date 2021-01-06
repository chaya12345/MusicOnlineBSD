import { Component, OnInit } from '@angular/core';
import { User } from '../classes/user';

@Component({
  selector: 'updatings-board',
  templateUrl: './updatings-board.component.html',
  styleUrls: ['./updatings-board.component.css', './../m-style.css']
})
export class UpdatingsBoardComponent implements OnInit {

  updatings = [];
  isUserConnected: boolean = false;
  user: User = new User();

  constructor() {
    this.checkIsUserConnected();
  }

  ngOnInit(): void {
  }

  checkIsUserConnected(): void {
    if ((localStorage.getItem("user") != null && localStorage.getItem("user") != undefined)
      || (sessionStorage.getItem("user") != null && sessionStorage.getItem("user") != undefined)) {
      this.user = JSON.parse(localStorage.getItem("user") || sessionStorage.getItem("user"));
      this.isUserConnected = true;
      console.log(this.user);
    }
  }

}
