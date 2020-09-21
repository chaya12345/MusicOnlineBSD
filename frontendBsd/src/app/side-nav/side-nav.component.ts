import { Component, EventEmitter, OnInit, Output } from '@angular/core';
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
    }];
  open: boolean = false;
  show: boolean = true;

  constructor(private shareDate: ShareDataService) { }

  ngOnInit() {
  }

  open_menu(): void {
    this.open = !this.open;
  }

  close_nav(): void {
    this.show = !this.show;
    if (!this.show)
      this.open = false;
    this.shareDate.emitChildEvent(this.show);
  }

}
