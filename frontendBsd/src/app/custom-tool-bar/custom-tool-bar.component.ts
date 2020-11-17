import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material';
import { RegisterToNewsletterComponent } from '../register-to-newsletter/register-to-newsletter.component';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'custom-tool-bar',
  templateUrl: './custom-tool-bar.component.html',
  styleUrls: ['./custom-tool-bar.component.css']
})
export class CustomToolBarComponent implements OnInit {

  @Output() onFollowUp: EventEmitter<boolean> = new EventEmitter<boolean>();
  @Input() isPublic?: boolean = true;
  @Input() isByName?: boolean = false;
  currentOrder: string = "date";
  currentDirection: boolean = false;
  currentPosition:number;
  isFocus: boolean = false;
  isOpened1: boolean = false;
  isOpened2: boolean = false;

  constructor(private storageService: StorageService, public dialog: MatDialog) {
   }

  ngOnInit(): void {
    this.currentPosition = window.pageYOffset;
    window.addEventListener('scroll', this.scroll, true);
    let dir = sessionStorage.getItem("reverse");
    if (dir) {
      this.currentDirection = parseInt(dir) == 1 ? true : false;
    }
  }

  ngOnDestroy() {
      window.removeEventListener('scroll', this.scroll, true);
  }

  scroll = (event): void => {
    let scroll = window.pageYOffset;
    if (scroll > this.currentPosition) {
      document.getElementById("customToolbar").style.transform = "translateY(-140px)";
    } else {
      document.getElementById("customToolbar").style.transform = "translateY(0)";
      this.timeoutToHide();
    }
    this.currentPosition = scroll;
  };

  timeoutToHide() {
    let scroll = window.pageYOffset;
      setTimeout(() => {
        if (this.currentPosition == scroll && this.isFocus == false && this.isOpened1 == false && this.isOpened2 == false)
          document.getElementById("customToolbar").style.transform = "translateY(-140px)";
      }, 5500);
  }

  saveOrderType(orderType: string): void {
    this.currentOrder = orderType;
    this.storageService.setItem("order-type", orderType);
    this.setDirection(orderType == "song");
  }

  setDirection(dir: boolean): void {
    this.currentDirection = dir;
    this.storageService.setItem("reverse", dir ? 1 : 0);
  }

  openDialogToNewsletter(): void {
    try {
      const dialogRef = this.dialog.open(RegisterToNewsletterComponent, {
        width: '400px',
        data: { }
      });
      dialogRef.afterClosed().subscribe(result => {
      });
    }
    catch (err) { console.log(err); }
  }

  addFollowUp(): void {
    this.onFollowUp.emit(true);
  }

}
