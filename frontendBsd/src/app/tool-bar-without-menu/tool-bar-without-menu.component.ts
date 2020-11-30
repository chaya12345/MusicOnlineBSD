import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';

@Component({
  selector: 'tool-bar-without-menu',
  templateUrl: './tool-bar-without-menu.component.html',
  styleUrls: ['./tool-bar-without-menu.component.css']
})

export class ToolBarWithoutMenuComponent implements OnInit {

  currentDirection: boolean = false;
  currentPosition: number;
  isFocus: boolean = false;
  isOpened1: boolean = false;
  isOpened2: boolean = false;

  constructor( public dialog: MatDialog) {
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

}
