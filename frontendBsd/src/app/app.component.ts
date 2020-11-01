import { Component, ElementRef, HostListener } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'מיוזיק online | בכל סגנון שתבחר';

  constructor() {
    // document.querySelector("html").addEventListener("mousewheel", this.wheelDistance.bind(this));
    window.onload = function () {
      var target = document.getElementById("html-bsd");
      this.animate(document.scrollingElement || document.documentElement, "scrollTop", "", 0, target.offsetTop, 2000, true);
    };
  }
  // not-working
  animate(elem, style, unit, from, to, time, prop) {
    if (!elem) {
      return;
    }
    var start = new Date().getTime(),
      timer = setInterval(function () {
        var step = Math.min(1, (new Date().getTime() - start) / time);
        if (prop) {
          elem[style] = (from + step * (to - from)) + unit;
        } else {
          elem.style[style] = (from + step * (to - from)) + unit;
        }
        if (step === 1) {
          clearInterval(timer);
        }
      }, 25);
    if (prop) {
      elem[style] = from + unit;
    } else {
      elem.style[style] = from + unit;
    }
  }


  // wheelDistance(evt) {
  //   var w = evt.wheelDelta;
  //   // console.log('scrolling');
  //   // console.log(w);
  //   var pos = document.documentElement.scrollTop || document.body.scrollTop;
  //   // console.log(pos);
  //   if (pos <= 300 && w > 0) {
  //     this.gotoTop();
  //   }
  //   return w / 120;
  // }

  // gotoTop() {
  //   window.scroll({
  //     top: 0,
  //     left: 0,
  //     behavior: 'smooth'
  //   });
  //   // console.log('bsd');
  // }
}
