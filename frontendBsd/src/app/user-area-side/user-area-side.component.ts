import { Component, Input, OnInit } from '@angular/core';
import { User } from '../classes/user';

@Component({
  selector: 'user-area-side',
  templateUrl: './user-area-side.component.html',
  styleUrls: ['./user-area-side.component.css']
})
export class UserAreaSideComponent implements OnInit {

  @Input() user: User;

  constructor() { }

  ngOnInit(): void {
  }

}
