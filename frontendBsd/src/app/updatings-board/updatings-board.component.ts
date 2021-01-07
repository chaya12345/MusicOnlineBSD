import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material';
import { User } from '../classes/user';
import { CommonMessageService } from '../services/common-message.service';
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

  constructor(private userService: UsersService, private _snackBar: MatSnackBar,
    private commonMessage: CommonMessageService) {
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
        console.log(updatings);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  togglePinnedItem(updating: UpdatingToUser): void {
    try {
      this.userService.addPinnedItemToUser(updating, this.user.id)
      .subscribe(result => {
        this.openSnackBar(result ? this.commonMessage.GENERATE.ADD.SUCCESS :
          this.commonMessage.GENERATE.ADD.ERROR);
      }, () => this.openSnackBar(this.commonMessage.GENERATE.ADD.ERROR))
    } catch { this.openSnackBar(this.commonMessage.GENERATE.ADD.ERROR); }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
