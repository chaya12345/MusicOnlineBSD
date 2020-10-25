import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'si-similar-results',
  templateUrl: './si-similar-results.component.html',
  styleUrls: ['./si-similar-results.component.css']
})
export class SiSimilarResultsComponent implements OnInit {

  @Input() songs: Song[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
