import { Component, OnInit } from '@angular/core';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'magazine',
  templateUrl: './magazine.component.html',
  styleUrls: ['./magazine.component.css']
})
export class MagazineComponent implements OnInit {

  navs: string[] = [];
  title: string = "";
  subtitle: string = "";
  img: string = "";
  icon: string = "";
  href: string = "";

  constructor(private topicsService: TopicsService) {
    this.navs.push("מגזין");
  }

  ngOnInit() {
    this.getTopic();
  }

  getTopic(): void {
    try {
      this.topicsService.getTopic("מגזין").subscribe(topic => {
        this.title = topic.title; this.subtitle = topic.subtitle;
        /*this.img = topic.img; */this.icon = topic.icon; this.href = topic.href;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
