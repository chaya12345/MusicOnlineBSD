import { Component, Input, OnInit } from '@angular/core';
import { GenericType } from '../classes/genericType';
import { ItemsByParameter } from '../classes/itemsByParameter';

@Component({
  selector: 'generic-area',
  templateUrl: './generic-area.component.html',
  styleUrls: ['./generic-area.component.css']
})
export class GenericAreaComponent implements OnInit {

  @Input() item: ItemsByParameter;
  type: string;
  icon: string;

  constructor() { }

  ngOnInit(): void {
    window.addEventListener('scroll', this.scroll, true);
    this.addAnimation();
  }

  ngOnChanges() {
    switch (this.item.type) {
      case "song":
        this.type = "שיר";
        this.icon = "headset";
        break;
      case "article":
        this.type = "כתבה";
        this.icon = "queue_music";
        break;
      case "performance":
        this.type = "הופעה";
        this.icon = "mic";
        break;
      case "clip":
        this.type = "קליפ";
        this.icon = "videocam";
        break;
      default:
        this.type = "שיר";
        this.icon = "headset";
        break;
    }
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
    var wrappers = document.getElementsByClassName("wrap-generic-area");
    for (var i = 0; i < wrappers.length; i++) {
      if (this.elementInViewport(wrappers[i]) == true) {
      (wrappers[i] as HTMLElement).style.animationName = "bigger";
      }
    }
  }

}
