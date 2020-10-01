import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
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
  navigateStr: string = "";

  constructor(private shareData: ShareDataService, private router: Router) { }

  ngOnInit() {
    this.href = this.router.url;
    console.log(this.href);
    console.log(this.href.includes("error"));
    if (this.href.includes("home"))
      this.navigateStr = "ראשי";
    else if (this.href.includes("song"))
      this.navigateStr = "חדש במוזיקה";
    else if (this.href.includes("article"))
      this.navigateStr = "מגזין";
    else if (this.href.includes("playlist"))
      this.navigateStr = "פלייליסטים";
    else if (this.href.includes("error")) {
      this.navigateStr = "שגיאה";
      console.log("errorrrrrrrr");
    }
    else this.navigateStr = "ראשי";
  }

  open_menu(e): void {
    this.open = !this.open;
  }

  close_nav(e): void {
    this.show = !this.show;
    if (!this.show)
      this.open = false;
    this.shareData.emitChildEvent(this.show);
  }

  navigate(event): void {
    if (event.target.innerHTML.includes("ראשי")) {
      this.router.navigateByUrl("home");
    }
    else if (event.target.innerHTML.includes("חדש במוזיקה")) {
      this.router.navigateByUrl("song");
    }
    else if (event.target.innerHTML.includes("מגזין")) {
      this.router.navigateByUrl("magazine");
    }
  }

}
