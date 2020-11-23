import { Component, OnInit } from '@angular/core';
import { InfoService } from '../services/info.service';

export class Info {
  data: string;
  count: number;
}

@Component({
  selector: 'admin-left-side',
  templateUrl: './admin-left-side.component.html',
  styleUrls: ['./admin-left-side.component.css']
})
export class AdminLeftSideComponent implements OnInit {

  name: string = "יעקב כהן";
  mail: string = "yaakov10@gmail.com";
  img: string = "";

  info: Info[]=[];

  constructor(private infoService: InfoService) {
    try {
      this.infoService.GetSongsCount().subscribe(count => this.info.push({ data: "שירים באתר", count: count }), err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetArticlesCount().subscribe(count =>this.info.push({ data: "כתבות באתר", count:count }), err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetPlaylistsCount().subscribe(count => this.info.push({ data: "פלייליסטים באתר", count: count }), err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetUsersCount().subscribe(count => this.info.push({ data: "משתמשים", count: count }), err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetSubsToNewsletterCount().subscribe(count => this.info.push({ data: "רשומים לניוזלטר", count: count }), err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }

}
