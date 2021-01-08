import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatSnackBar } from '@angular/material';
import { User } from '../classes/user';
import { CommonMessageService } from '../services/common-message.service';
import { UpdatingToUser, UsersService } from '../services/users.service';

@Component({
  selector: 'updating',
  templateUrl: './updating.component.html',
  styleUrls: ['./updating.component.css']
})
export class UpdatingComponent implements OnInit {

  @Input() item: UpdatingToUser;
  @Input() user: User;
  @Output() onTogglePinning = new EventEmitter<UpdatingToUser>();

  constructor(private userService: UsersService, private commonMessage: CommonMessageService,
    private _snackBar: MatSnackBar) { }

  ngOnInit(): void {
  }

  togglePinnedItem(updating: UpdatingToUser): void {
    if (!updating.isPinned) {
      try {
        this.userService.addPinnedItemToUser(updating, this.user.id)
          .subscribe(result => {
            this.openSnackBar(result ? this.commonMessage.GENERATE.ADD.SUCCESS :
              this.commonMessage.GENERATE.ADD.ERROR);
            this.onTogglePinning.emit(updating);
          }, () => this.openSnackBar(this.commonMessage.GENERATE.ADD.ERROR));
      } catch { this.openSnackBar(this.commonMessage.GENERATE.ADD.ERROR); }
    }
    else {
      try {
        this.userService.deletePinnedItemToUser(this.user.id, updating.id, updating.type)
          .subscribe(result => {
            this.openSnackBar(result ? this.commonMessage.GENERATE.REMOVE.SUCCESS :
              this.commonMessage.GENERATE.REMOVE.ERROR);
            this.onTogglePinning.emit(updating);
          }, () => this.openSnackBar(this.commonMessage.GENERATE.REMOVE.ERROR));
      } catch { this.openSnackBar(this.commonMessage.GENERATE.REMOVE.ERROR); }
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
