import { Component, Input, OnInit } from '@angular/core';
import { ResponsesToSongs } from '../classes/responsesToSongs';

@Component({
  selector: 'responses-song',
  templateUrl: './responses-song.component.html',
  styleUrls: ['./responses-song.component.css']
})
export class ResponsesSongComponent implements OnInit {
  
  @Input() responses: ResponsesToSongs[] = [];

  constructor() { }

  ngOnInit() {
  }

}
