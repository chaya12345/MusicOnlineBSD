import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'main-actions',
  templateUrl: './main-actions.component.html',
  styleUrls: ['./main-actions.component.css']
})
export class MainActionsComponent implements OnInit {

  message: string = "האתר שומר על זכויות יוצרים. אם נתקלת בהפרת זכויות נא דווח לנו ונסיר באופן מידי.";

  constructor() { }

  ngOnInit(): void {
  }

}
