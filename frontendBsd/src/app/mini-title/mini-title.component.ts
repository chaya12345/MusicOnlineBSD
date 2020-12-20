import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'mini-title',
  templateUrl: './mini-title.component.html',
  styleUrls: ['./mini-title.component.css']
})
export class MiniTitleComponent implements OnInit {

  @Input() text: string = "";

  constructor() { }

  ngOnInit(): void {
  }

}
