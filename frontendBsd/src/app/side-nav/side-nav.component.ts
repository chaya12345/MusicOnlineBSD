import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { $ } from 'protractor';
import { Song } from '../classes/song';
import { ShareDataService } from '../services/share-data.service';

@Component({
  selector: 'side-nav',
  templateUrl: './side-nav.component.html',
  styleUrls: ['./side-nav.component.css']
})
export class SideNavComponent implements OnInit {

  navigations = [
    {
      name: "ראשי",
      icon: "dashboard"
    }, {
      name: "חדש במוזיקה",
      icon: "headset"
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
    }];
  open: boolean = false;
  show: boolean = true;
  href: string = ""
  navigate: string = "";

  constructor(private shareData: ShareDataService, private router: Router) { }

  ngOnInit() {
    this.href = this.router.url;
    if (this.href.includes("home"))
      this.navigate = "ראשי";
    else if (this.href.includes("song"))
      this.navigate = "חדש במוזיקה";
    else if (this.href.includes("article"))
      this.navigate = "מגזין";
    else if (this.href.includes("playlist"))
      this.navigate = "פלייליסטים";
    else this.navigate = "ראשי";
  }

  open_menu(): void {
    this.open = !this.open;
  }

  close_nav(): void {
    this.show = !this.show;
    if (!this.show)
      this.open = false;
    this.shareData.emitChildEvent(this.show);
  }

}
