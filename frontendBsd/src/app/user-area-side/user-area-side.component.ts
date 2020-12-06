import { Component, Input, OnInit } from '@angular/core';
import { User } from '../classes/user';
import { eInfo, UserInfo, UsersService } from '../services/users.service';

@Component({
  selector: 'user-area-side',
  templateUrl: './user-area-side.component.html',
  styleUrls: ['./user-area-side.component.css']
})
export class UserAreaSideComponent implements OnInit {

  @Input() user: User;
  userInfo: UserInfo[] = [];

  constructor(private userService: UsersService) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.user != null)
      this.getUserInfo();
  }

  getUserInfo(): void {
    try {
      this.userService.GetUserInfo(this.user.id).subscribe(usrInfo => { this.userInfo = usrInfo; console.log(usrInfo);
        console.log(usrInfo[0].list.image); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getInfoName(value: number, length: number): string {
    switch (value) {
      case eInfo.FOLLOW_UP_SONGS:
        return length + " מעקבים לשירים";
      case eInfo.FOLLOW_UP_ARTICLES:
        return length + " מעקבים לכתבות";
      case eInfo.SUBSCRIPTION:
        return length + " מנויים לזמרים";
    }
  }

}
