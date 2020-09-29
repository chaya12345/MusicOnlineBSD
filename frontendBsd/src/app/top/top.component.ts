import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'top',
  templateUrl: './top.component.html',
  styleUrls: ['./top.component.css']
})
export class TopComponent implements OnInit {

  @Input() img: string;
  @Input() _title: string;
  @Input() subtitle: string;

  constructor() { }

  ngOnInit() {
  }

}
