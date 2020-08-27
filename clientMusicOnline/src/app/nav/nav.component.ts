import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent implements OnInit {
  
  navigations = [
    {
      name: "ניוזיק",
      icon: "music_note"
    }, {
      name: "מיוזיקליפ",
      icon: "play_circle_filled"
    }, {
      name: "ערוצי מוזיקה",
      icon: "equalizer"
    }, {
      name: "מגזין חדשות המוזיקה",
      icon: "queue_music"
    }, {
      name: "חיפוש חכם",
      icon: "search"
    }];

  constructor() { }

  ngOnInit() {
  }

}
