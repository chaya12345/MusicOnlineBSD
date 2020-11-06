import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Topics } from '../classes/topics';
import { ShareDataService } from '../services/share-data.service';
import { TopicsService } from '../services/topics.service';

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
  topics: Topics[] = [];
  open: boolean = false;
  show: boolean = true;
  href: string = ""
  navigateStr: string = "";

  constructor(private shareData: ShareDataService, private router: Router,
    private topicsService: TopicsService) {
    try {
      this.topicsService.getTopics().subscribe(topics => {
        this.topics = topics;
        if (sessionStorage.getItem("manager")) {
          let settings = new Topics();
          settings.title = "איזור מנהל";
          settings.icon = "admin_panel_settings";
          settings.href = "settings?manager=" + sessionStorage.getItem("manager");
          this.topics.push(settings);
        }
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnInit() {
    this.href = this.router.url;
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
    else if (event.target.innerHTML.includes("פלייליסטים")) {
      this.router.navigateByUrl("playlists");
    }
  }

}
