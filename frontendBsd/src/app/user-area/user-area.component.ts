import { Component, OnInit } from '@angular/core';
import { User } from '../classes/user';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'user-area',
  templateUrl: './user-area.component.html',
  styleUrls: ['./user-area.component.css']
})
export class UserAreaComponent implements OnInit {

  user: User;

  constructor(private userService: UsersService) {
    this.getUserById();
  }

  ngOnInit(): void {
  }

  getUserById(): void {
    try {
      this.userService.logIn("איציק לוי",
        "5XBaN@c52gNsHiK").subscribe(user => this.user = user, err => console.log(err));
      this.userService.getUsers().subscribe(users => this.user = users[9]);
    } catch (err) { console.log(err); }
  }

}
