import { Component, OnInit, Input } from '@angular/core';
import { ResponsesToSongs } from '../classes/responsesToSongs';

@Component({
  selector: 'response',
  templateUrl: './response.component.html',
  styleUrls: ['./response.component.css']
})
export class ResponseComponent implements OnInit {

  @Input() response: any;
  
  constructor() { }

  ngOnInit(): void {
  }

}
