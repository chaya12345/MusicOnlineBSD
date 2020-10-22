import { Component, Input, OnInit } from '@angular/core';
import { PlaylistSystem } from '../classes/playlistSystem';

@Component({
  selector: 'display-playlist',
  templateUrl: './display-playlist.component.html',
  styleUrls: ['./display-playlist.component.css']
})
export class DisplayPlaylistComponent implements OnInit {

  @Input() playlist: PlaylistSystem;

  constructor() { }

  ngOnInit(): void {
    window.addEventListener('scroll', this.scroll, true);
    this.addAnimation();
  }

  ngOnDestroy() {
      window.removeEventListener('scroll', this.scroll, true);
  }

  scroll = (event): void => {
    this.addAnimation();
  };
  
  elementInViewport(el) {
    var top = el.offsetTop;
    var left = el.offsetLeft;
    var width = el.offsetWidth;
    var height = el.offsetHeight;
  
    while(el.offsetParent) {
      el = el.offsetParent;
      top += el.offsetTop;
      left += el.offsetLeft;
    }
  
    return (
      top < (window.pageYOffset + window.innerHeight) &&
      left < (window.pageXOffset + window.innerWidth) &&
      (top + height) > window.pageYOffset &&
      (left + width) > window.pageXOffset
    );
  }

  addAnimation(): void {
    var wrappers = document.getElementsByClassName("wrap-popular-playlist");
    for (var i = 0; i < wrappers.length; i++) {
      if (this.elementInViewport(wrappers[i]) == true) {
      (wrappers[i] as HTMLElement).style.animationName = "bigger";
      }
    }
  }

}
