import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'top',
  templateUrl: './top.component.html',
  styleUrls: ['./top.component.css']
})
export class TopComponent implements OnInit {

  @Input() title: string;
  @Input() icon: string;
  
  constructor() { }

  ngOnInit() {
  }

}
