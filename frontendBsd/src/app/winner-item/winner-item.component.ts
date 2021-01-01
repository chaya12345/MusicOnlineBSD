import { Component, Input, OnInit } from '@angular/core';
import { ItemsToParade } from '../classes/itemsToParade';

@Component({
  selector: 'winner-item',
  templateUrl: './winner-item.component.html',
  styleUrls: ['./winner-item.component.css']
})
export class WinnerItemComponent implements OnInit {

  @Input() item: ItemsToParade;
  @Input() isSong: boolean = true;
  isHover: boolean = false;

  constructor() { }

  ngOnInit(): void {
  }

}
