import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'title',
  templateUrl: './title.component.html',
  styleUrls: ['./title.component.css']
})
export class TitleComponent implements OnInit {

  @Input() text: string = "";

  constructor() { }

  ngOnInit(): void {
  }

}
