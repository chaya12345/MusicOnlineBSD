import { Component, Input, OnInit } from '@angular/core';
import { ItemsToParade } from '../classes/itemsToParade';

@Component({
  selector: 'rest-item',
  templateUrl: './rest-item.component.html',
  styleUrls: ['./rest-item.component.css']
})
export class RestItemComponent implements OnInit {

  @Input() item: ItemsToParade;
  @Input() placing: number = 0;
  isHover: boolean = false;

  constructor() { }

  ngOnInit(): void {
  }

}
