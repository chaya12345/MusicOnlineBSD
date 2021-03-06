import { Component, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { ItemsWithPinnedToUser } from '../classes/itemsWithPinnedToUser';
import { User } from '../classes/user';
import { LogInComponent } from '../log-in/log-in.component';
import { CommonMessageService } from '../services/common-message.service';
import { SearchingOfUser, SearchingsOfUserService } from '../services/searchings-of-user.service';
import { UpdatingToUser, UsersService } from '../services/users.service';

@Component({
  selector: 'updatings-board',
  templateUrl: './updatings-board.component.html',
  styleUrls: ['./updatings-board.component.css', './../m-style.css']
})
export class UpdatingsBoardComponent implements OnInit {

  isUserConnected: boolean = false;
  user: User = new User();
  updatings: ItemsWithPinnedToUser[] = [];
  pinnedItems: ItemsWithPinnedToUser[] = [];
  notPinnedItems: ItemsWithPinnedToUser[] = [];

  constructor(private userService: UsersService, private _snackBar: MatSnackBar,
    private commonMessage: CommonMessageService, private searchingsOfUserService: SearchingsOfUserService,
    private dialog: MatDialog) {
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
      this.searchingsOfUserService.getUpdatingsToUser(userId).subscribe(update => {
        this.updatings = update;
        this.updatings.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.sortUpdatingsInMatchLists();
      },err=>console.log(err))
    } catch (err) { console.log(err); }
  }

  togglePinning(updating: UpdatingToUser): void {
    this.updatings.some(item => {
      if (item.id == updating.id && item.type == updating.type) {
        item.isPinned = !item.isPinned;
      }
    });
    this.sortUpdatingsInMatchLists();
  }

  sortUpdatingsInMatchLists(): void {
    this.pinnedItems = [];
    this.notPinnedItems = [];
    this.updatings.forEach(updating => {
      if (updating.isPinned) {
        this.pinnedItems.push(updating);
      }
      else {
        this.notPinnedItems.push(updating);
      }
    });
  }

  openLoginDialog() {
    try {
      const dialogRef = this.dialog.open(LogInComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => {
      });
    } catch (err) { console.log(err); }
  }

}
