import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'latest-clip',
  templateUrl: './latest-clip.component.html',
  styleUrls: ['./latest-clip.component.css']
})
export class LatestClipComponent implements OnInit {

  @Input() clip: Song;

  constructor() { }

  ngOnInit() {
  }

}
