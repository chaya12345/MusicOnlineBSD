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
      if (sessionStorage.getItem('user'))
        this.user = JSON.parse(sessionStorage.getItem('user'));
      else
        this.userService.logIn("איציק לוי",
          "5XBaN@c52gNsHiK").subscribe(user => { this.user = user; console.log(this.user) }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
