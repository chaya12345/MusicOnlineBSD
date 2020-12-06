import { Component, Input, OnInit } from '@angular/core';
import { User } from '../classes/user';

@Component({
  selector: 'user-area-center',
  templateUrl: './user-area-center.component.html',
  styleUrls: ['./user-area-center.component.css']
})
export class UserAreaCenterComponent implements OnInit {

  @Input() user: User;

  constructor() { }

  ngOnInit(): void {
  }

}
