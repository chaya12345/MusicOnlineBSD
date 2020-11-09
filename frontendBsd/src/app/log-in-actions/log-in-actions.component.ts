import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material';
import { LogInComponent } from '../log-in/log-in.component';
import { MessageComponent } from '../message/message.component';
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

  constructor(public dialog: MatDialog, private storageService: StorageService) { }

  ngOnInit(): void {
    this.isConnected();
    this.storageService.watchStorage().subscribe(data => {
      if (data == 'user') {
        this.isConnected();
      }
    });
  }

  isConnected() {
    if (sessionStorage.getItem('user') != null && sessionStorage.getItem('user') != undefined) {
      this.connected = true;
    }
    else { this.connected = false; }
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

}
