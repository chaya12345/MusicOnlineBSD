import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'side',
  templateUrl: './side.component.html',
  styleUrls: ['./side.component.css']
})
export class SideComponent implements OnInit {

  @Input() similarSongs: Song[] = [];

  constructor() { }

  ngOnInit() {
  }

}
