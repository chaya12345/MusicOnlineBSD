import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material';
import { Router } from '@angular/router';
import { User } from '../classes/user';
import { LogInComponent } from '../log-in/log-in.component';
import { MessageComponent } from '../message/message.component';
import { ShareDataService } from '../services/share-data.service';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'log-in-actions',
  templateUrl: './log-in-actions.component.html',
  styleUrls: ['./log-in-actions.component.css']
})
export class LogInActionsComponent implements OnInit {

  @Output() opened: EventEmitter<void> = new EventEmitter();
  @Output() closed: EventEmitter<void> = new EventEmitter();
  connected: boolean = true;
  text: string = "האם אתה בטוח שברצונך להתנתק?";

  constructor(public dialog: MatDialog, private storageService: StorageService,
    private router: Router, private shareDataService: ShareDataService) { }

  ngOnInit(): void {
    this.isConnected();
    this.storageService.watchStorage().subscribe(data => {
      if (data == 'user') {
        this.isConnected();
      }
    });
  }

  isConnected(): boolean {
    if (sessionStorage.getItem('user') != null && sessionStorage.getItem('user') != undefined) {
      this.connected = true;
    }
    else { this.connected = false; }
    return this.connected;
  }

  openLoginDialog() {
    try {
      const dialogRef = this.dialog.open(LogInComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => {
        this.isConnected();
      });
    } catch (err) { console.log(err); }
  }

  logout() {
    sessionStorage.removeItem('user');
    this.connected = false;
  }
  
  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.logout();
        else this.isConnected();
      });
    } catch (err) { console.log(err); }
  }

  isFocus(focus: boolean) {
    focus ? this.opened.emit() : this.closed.emit();
  }

  navigateToPA(): void {
    if (this.isConnected()) {
      let user: User = JSON.parse(sessionStorage.getItem("user"));
      this.router.navigateByUrl("/user-area");
      this.shareDataService.emitUserConnect(user);
    }
    else {
      this.openLoginDialog();
    }
  }

}
