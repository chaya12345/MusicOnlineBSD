import { Component, OnInit } from '@angular/core';
import { InfoService } from '../services/info.service';

export class Info {
  data: string;
  count: number;
  type: Type
}

export enum Type { SONG, ARTICLE, PLAYLIST, USER, SUBSCRIPTION };

@Component({
  selector: 'site-status',
  templateUrl: './site-status.component.html',
  styleUrls: ['./site-status.component.css']
})
export class SiteStatusComponent implements OnInit {

  info: Info[] = [];

  constructor(private infoService: InfoService) {
    this.getInfo();
  }

  ngOnInit(): void {
    this.info = [{
      type: Type.SONG,
      data: "שירים",
      count: 0
    }, {
      type: Type.ARTICLE,
      data: "כתבות",
      count: 0
    }, {
      type: Type.PLAYLIST,
      data: "פלייליסטים",
      count: 0
    }, {
      type: Type.USER,
      data: "משתמשים",
      count: 0
    }, {
      type: Type.SUBSCRIPTION,
      data: "רשומים לניוזלטר",
      count: 0
    }]
  }

  getInfo(): void {
    try {
      this.infoService.GetSongsCount().subscribe(count =>
        this.setCount(Type.SONG, count), err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetArticlesCount().subscribe(count =>
        this.setCount(Type.ARTICLE, count), err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetPlaylistsCount().subscribe(count =>
        this.setCount(Type.PLAYLIST, count), err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetUsersCount().subscribe(count =>
        this.setCount(Type.USER, count), err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetSubsToNewsletterCount().subscribe(count =>
        this.setCount(Type.SUBSCRIPTION, count), err => console.log(err));
    } catch (err) { console.log(err); }
  }

  setCount(type: Type, count: number): void {
    this.info.forEach(status => {
      if (status.type == type) {
        status.count = count - 45 >= 0 ? count - 45 : 0;
        let interval = setInterval(() => {
          status.count++;
          if (status.count == count) clearInterval(interval);
        }, 70); //count > 50 ? 50 : (count > 25 ? 100 : 200)
      }
    });
  }

}
