import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'vertical-progress-bar',
  templateUrl: './vertical-progress-bar.component.html',
  styleUrls: ['./vertical-progress-bar.component.css']
})
export class VerticalProgressBarComponent implements OnInit {

  @Input() value: number = 0;
  @Input() isHover?: boolean = false;

  constructor() { }

  ngOnInit(): void {
  }

}
