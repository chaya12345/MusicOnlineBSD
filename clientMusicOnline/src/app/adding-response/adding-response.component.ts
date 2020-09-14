import { Component, OnInit, ViewChild } from '@angular/core';
import { MatAccordion } from '@angular/material';

@Component({
  selector: 'adding-response',
  templateUrl: './adding-response.component.html',
  styleUrls: ['./adding-response.component.css']
})
export class AddingResponseComponent implements OnInit {

  isWantToAdd: boolean = false;
  @ViewChild(MatAccordion) accordion: MatAccordion;

  constructor() { }

  ngOnInit(): void {
  }

  toggleResponse(): void {
    this.isWantToAdd = !this.isWantToAdd;
  }

}
