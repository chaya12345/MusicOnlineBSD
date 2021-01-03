import { Component, Input, OnInit, Renderer2, ViewChild } from '@angular/core';
// import { MatVideoComponent } from 'mat-video/lib/video.component';

@Component({
  selector: 'video-section',
  templateUrl: './video-section.component.html',
  styleUrls: ['./video-section.component.css']
})
export class VideoSectionComponent implements OnInit {
  
  // @ViewChild('video') matVideo: MatVideoComponent;
  video: HTMLVideoElement;

  @Input() src?: string = "";
  @Input() type?: string = "audio";
  @Input() img?: string = "";

  constructor(private renderer: Renderer2) { }

  ngOnInit() {
  }

  ngOnChanges() {
    // this.video = this.matVideo.getVideoTag();
 
    // Use Angular renderer or addEventListener to listen for standard HTML5 video events
    
    // this.renderer.listen(this.video, 'ended', () => console.log('video ended'));
    // this.video.addEventListener('ended', () => console.log('video ended'));
    // this.video.addEventListener('playing', (event) => { console.log('Video is no longer paused'); });
  }

}
