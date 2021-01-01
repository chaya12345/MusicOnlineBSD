import { Component, Input, OnInit } from '@angular/core';
import { ItemsToParade } from '../classes/itemsToParade';

@Component({
  selector: 'following-item',
  templateUrl: './following-item.component.html',
  styleUrls: ['./following-item.component.css']
})
export class FollowingItemComponent implements OnInit {

  @Input() item: ItemsToParade;
  @Input() isSecond?: boolean = true;
  isHover: boolean = false;

  constructor() { }

  ngOnInit(): void {
  }

}
