import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material';
import { ItemsWithPinnedToUser } from '../classes/itemsWithPinnedToUser';
import { User } from '../classes/user';
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
  // updatings: UpdatingToUser[] = [];
  // pinnedItems: UpdatingToUser[] = [];
  // notPinnedItems: UpdatingToUser[] = [];

  constructor(private userService: UsersService, private _snackBar: MatSnackBar,
    private commonMessage: CommonMessageService, private searchingsOfUserService: SearchingsOfUserService) {
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
    // try {
    //   this.userService.getUpdatings(userId)
    //     .subscribe(updatings => {
    //       this.updatings = updatings;
    //       this.updatings.sort((a, b) =>
    //         Math.round(new Date(b.date).getTime() -
    //           new Date(a.date).getTime()));
    //         this.sortUpdatingsInMatchLists();
    //       console.log(updatings);
    //     }, err => console.log(err));
    // } catch (err) { console.log(err); }
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

  // togglePinnedItem(updating: UpdatingToUser): void {
  //   if (!updating.isPinned) {
  //     try {
  //       this.userService.addPinnedItemToUser(updating, this.user.id)
  //         .subscribe(result => {
  //           this.openSnackBar(result ? this.commonMessage.GENERATE.ADD.SUCCESS :
  //             this.commonMessage.GENERATE.ADD.ERROR);
  //         }, () => this.openSnackBar(this.commonMessage.GENERATE.ADD.ERROR))
  //     } catch { this.openSnackBar(this.commonMessage.GENERATE.ADD.ERROR); }
  //   }
  //   else {
  //     try {
  //       this.userService.deletePinnedItemToUser(this.user.id, updating.id, updating.type)
  //         .subscribe(result => {
  //           this.openSnackBar(result ? this.commonMessage.GENERATE.REMOVE.SUCCESS :
  //             this.commonMessage.GENERATE.REMOVE.ERROR);
  //         })
  //     } catch { this.openSnackBar(this.commonMessage.GENERATE.REMOVE.ERROR); }
  //   }
  // }

  // openSnackBar(message: string) {
  //   this._snackBar.open(message, '', {
  //     duration: 2000,
  //   });
  // }

}
