import { Component, ElementRef, HostListener, ViewChild } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'מיוזיק online | בכל סגנון שתבחר';

  constructor() {
    document.querySelector("html").addEventListener("mousewheel", this.wheelDistance.bind(this));
  }

  // @ViewChild('scroll', { read: ElementRef, static: true }) public scroll: ElementRef<any>;

  // @HostListener('window:scroll')
  wheelDistance(evt) {
    var w = evt.wheelDelta;
    console.log('scrolling');
    console.log(w);
    var pos = document.documentElement.scrollTop || document.body.scrollTop;
    console.log(pos);
    if (pos <= 300 && w > 0) {
      this.gotoTop();
    }
    return w / 120;
  }

  gotoTop() {
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
    console.log('bsd');
  }
}
