import { Component, OnInit, ViewEncapsulation } from '@angular/core';

@Component({
  selector: 'side-nav',
  templateUrl: './side-nav.component.html',
  styleUrls: ['./side-nav.component.css'],
  encapsulation: ViewEncapsulation.None,
})
export class SideNavComponent implements OnInit {

  navigations = [
    {
      name: "ניוזיק",
      icon: "music_note"
    }, {
      name: "מיוזיקליפ",
      icon: "play_circle_filled"
    }, {
      name: "פלייליסטים",
      icon: "equalizer"
    }, {
      name: "מגזין",
      icon: "queue_music"
    }, {
      name: "הופעות",
      icon: "mic"
    }, {
      name: "חיפוש חכם",
      icon: "search"
    }, {
      name: "אהובים",
      icon: "favorite_border"
    }, {
      name: "נצפים",
      icon: "star"
    }];
  open: boolean = false;
  show: boolean = true;

  constructor() { }

  ngOnInit() {
  }

  open_menu(event): void {
    this.open = !this.open;
  }

  close_nav(event): void {
    this.show = !this.show;
    if (!this.show)
      this.open = false;
  }

}
