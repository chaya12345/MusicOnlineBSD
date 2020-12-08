import { Component, Input, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { User } from '../classes/user';
import { MessageComponent } from '../message/message.component';
import { CommonMessageService } from '../services/common-message.service';
import { FollowUpService } from '../services/follow-up.service';
import { SubscriptionService } from '../services/subscription.service';
import { ToolbarService } from '../services/toolbar.service';
import { eInfo, Simple, UserInfo, UsersService } from '../services/users.service';

@Component({
  selector: 'user-area-side',
  templateUrl: './user-area-side.component.html',
  styleUrls: ['./user-area-side.component.css']
})
export class UserAreaSideComponent implements OnInit {

  @Input() user: User;
  userInfo: UserInfo[] = [];

  constructor(private userService: UsersService, private dialog: MatDialog,
    private toolbarService: ToolbarService, private _snackbar: MatSnackBar,
    private followUpService: FollowUpService, private cmService: CommonMessageService,
    private subscriptionService: SubscriptionService) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.user != null)
      this.getUserInfo();
  }

  getUserInfo(): void {
    try {
      this.userService.GetUserInfo(this.user.id).subscribe(usrInfo => {
        this.userInfo = usrInfo; console.log(usrInfo);
        console.log(usrInfo[0].list.image);
      }, err => console.log(err));
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

  getHref(info: UserInfo, item: Simple): string {
    switch (info.name) {
      case eInfo.FOLLOW_UP_SONGS:
        return "song?songId=" + item.id;
      case eInfo.FOLLOW_UP_ARTICLES:
        return "magazine/article?articleId=" + item.id;
      case eInfo.SUBSCRIPTION:
        return "song?filter=" + item.name;
    }
  }

  openMessageDialog(text: string, info: UserInfo, item: Simple) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.remove(info, item);
      });
    } catch (err) { console.log(err); }
  }

  remove(info: UserInfo, item: Simple): void {
    // TODO remove item
    if (info.name == eInfo.FOLLOW_UP_SONGS || info.name == eInfo.FOLLOW_UP_ARTICLES) {
      try {
        this.followUpService.deleteFollowUp(this.user.id, item.id, 
          info.name == eInfo.FOLLOW_UP_SONGS ? "song" : "article").subscribe(result => {
          result == true ?
            this.openSnackBar(this.cmService.FOLLOW_UP.REMOVE.SUCCESS) :
            this.openSnackBar(this.cmService.FOLLOW_UP.REMOVE.FAIL);
          this.userInfo = [];
          this.getUserInfo();
        }, err => console.log(err));
      } catch (err) { this.openSnackBar(this.cmService.ERROR); }
    }
    else if (info.name == eInfo.SUBSCRIPTION) {
      try {
        this.subscriptionService.deleteSubscription(this.user.id, item.id).subscribe(result => {
          result == true ?
            this.openSnackBar(this.cmService.SUBSCRIPTION.REMOVE.SUCCESS) :
            this.openSnackBar(this.cmService.SUBSCRIPTION.REMOVE.FAIL);
          this.userInfo = [];
          this.getUserInfo();
        }, err => console.log(err));
      } catch (err) { this.openSnackBar(this.cmService.ERROR); }
    }
  }

  private openSnackBar(message: string) {
    this._snackbar.open(message, '', {
      duration: 2000
    });
  }

}
