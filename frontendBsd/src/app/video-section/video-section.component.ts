import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'video-section',
  templateUrl: './video-section.component.html',
  styleUrls: ['./video-section.component.css']
})
export class VideoSectionComponent implements OnInit {

  @Input() src?: string = "";
  @Input() type?: string = "audio";
  @Input() img?: string = "";

  constructor() { }

  ngOnInit() {
  }

}
