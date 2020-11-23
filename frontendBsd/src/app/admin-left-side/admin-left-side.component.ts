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

  info: Info[];
  countSongs: number;
  countArticles: number;
  countPlaylists: number;
  countUsers: number;
  countNewsletter: number;

  constructor(private infoService: InfoService) {
    try {
      this.infoService.GetSongsCount().subscribe(count => this.countSongs = count, err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetArticlesCount().subscribe(count => this.countArticles = count, err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetPlaylistsCount().subscribe(count => this.countPlaylists = count, err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetUsersCount().subscribe(count => this.countUsers = count, err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.infoService.GetSubsToNewsletterCount().subscribe(count => this.countNewsletter = count, err => console.log(err));
    } catch (err) { console.log(err); }
    this.info = [{ data: "שירים באתר", count: this.countSongs },
    { data: "כתבות באתר", count: this.countArticles },
    { data: "פלייליסטים באתר", count: this.countPlaylists },
    { data: "משתמשים", count: this.countUsers },
    { data: "רשומים לניוזלטר", count: this.countNewsletter }];
  }

  ngOnInit(): void {
  }

}
