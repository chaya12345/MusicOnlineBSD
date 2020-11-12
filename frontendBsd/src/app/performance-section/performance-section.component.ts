import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'performance-section',
  templateUrl: './performance-section.component.html',
  styleUrls: ['./performance-section.component.css']
})
export class PerformanceSectionComponent implements OnInit {

  @Input() performance: Song;

  constructor() { }

  ngOnInit(): void {
  }

}
