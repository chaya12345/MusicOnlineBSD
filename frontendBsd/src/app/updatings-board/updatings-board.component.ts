import { Component, OnInit } from '@angular/core';
import { User } from '../classes/user';
import { UpdatingToUser, UsersService } from '../services/users.service';

@Component({
  selector: 'updatings-board',
  templateUrl: './updatings-board.component.html',
  styleUrls: ['./updatings-board.component.css', './../m-style.css']
})
export class UpdatingsBoardComponent implements OnInit {

  isUserConnected: boolean = false;
  user: User = new User();
  updatings: UpdatingToUser[] = [];

  constructor(private userService: UsersService) {
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
      this.getUpdatingsToUser(this.user.id);
    }
  }

  getUpdatingsToUser(userId: number): void {
    try {
      this.userService.getUpdatings(userId)
      .subscribe(updatings => {
        this.updatings = updatings;
        updatings.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
