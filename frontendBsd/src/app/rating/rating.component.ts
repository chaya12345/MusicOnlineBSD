import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'rating',
  templateUrl: './rating.component.html',
  styleUrls: ['./rating.component.css']
})
export class RatingComponent implements OnInit {

  @Input() likes?: number = 0;
  @Input() views?: number = 0;
  @Input() responses?: number = 0;

  constructor() { }

  ngOnInit() {
  }

}
