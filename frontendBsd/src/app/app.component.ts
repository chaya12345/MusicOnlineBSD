import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'מיוזיק online | בכל סגנון שתבחר';
  wheelDistance(evt) {

  // wheelDelta inidicates how  
  // Far the wheel is turned 
  var w = evt.wheelDelta;
  console.log('scrolling');
  console.log(w);
  var pos = document.documentElement.scrollTop || document.body.scrollTop;
  console.log(pos);
  if (pos <= 300 && w > 0) {
    console.log('yes');
    document.documentElement.scrollTo(0, 0);
    document.documentElement.scrollTop = 0;
  }

  // Returning normalized value 
  return w / 120;
}
constructor() {
  document.querySelector("html").addEventListener("mousewheel", this.wheelDistance.bind(this));
}

// Adding event listener for some element 
}
