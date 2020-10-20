import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'generic-area',
  templateUrl: './generic-area.component.html',
  styleUrls: ['./generic-area.component.css']
})
export class GenericAreaComponent implements OnInit {

  @Input() item: any;

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
    var wrappers = document.getElementsByClassName("wrap-article");
    for (var i = 0; i < wrappers.length; i++) {
      if (this.elementInViewport(wrappers[i]) == true) {
      (wrappers[i] as HTMLElement).style.animationName = "bigger";
      }
    }
  }

}
