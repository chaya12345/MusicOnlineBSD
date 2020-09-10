import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'responses',
  templateUrl: './responses.component.html',
  styleUrls: ['./responses.component.css']
})
export class ResponsesComponent implements OnInit {

  isWantToAdd: boolean = false;

  constructor() { }

  ngOnInit(): void {
  }

  toggleResponse(): void {
    this.isWantToAdd = !this.isWantToAdd;
  }

}
