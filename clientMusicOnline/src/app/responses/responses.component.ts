import { Component, OnInit, Input, ViewChild } from '@angular/core';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { MatAccordion } from '@angular/material/expansion';

@Component({
  selector: 'responses',
  templateUrl: './responses.component.html',
  styleUrls: ['./responses.component.css']
})
export class ResponsesComponent implements OnInit {

  @Input() responsesList: ResponsesToSongs[] = [];
  isWantToAdd: boolean = false;
  @ViewChild(MatAccordion) accordion: MatAccordion;

  constructor() { }

  ngOnInit(): void {
  }

  toggleResponse(): void {
    this.isWantToAdd = !this.isWantToAdd;
  }

}
