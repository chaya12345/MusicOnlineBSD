import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Topics } from '../classes/topics';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'current-nav',
  templateUrl: './current-nav.component.html',
  styleUrls: ['./current-nav.component.css']
})
export class CurrentNavComponent implements OnInit {

  @Input() navs?: string[] = [];
  topics: Topics[] = [];

  constructor(private topicsService: TopicsService, private router: Router) {
  }

  ngOnInit() {
    this.navs.reverse();
    this.navs.push("ראשי");
    this.navs.reverse();
  }

  navigate(nav: string): string {
    let navigation: string = "";
    try {
      this.topicsService.getTopics().subscribe(topics => this.topics = topics, err => console.log(err));
    } catch (err) { console.log(err); }
    let isExist: boolean = false;
    this.topics.forEach((topic) => {
      if (topic.title == nav) {
        isExist = true;
      }
    });
    if (isExist) {
      try {
        this.topicsService.getTopic(nav).subscribe(topic => navigation = topic.href, err => console.log(err));
      } catch (err) { console.log(err); }
      return navigation;
    }
    return this.router.url;
  }

}
