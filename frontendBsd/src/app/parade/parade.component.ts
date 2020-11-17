import { Component, OnInit } from '@angular/core';
import { Topics } from '../classes/topics';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'parade',
  templateUrl: './parade.component.html',
  styleUrls: ['./parade.component.css']
})
export class ParadeComponent implements OnInit {

  topic: Topics = new Topics();
  navs: string[] = [];

  constructor(private topicsService: TopicsService) { 
    try {
      this.topicsService.getTopic("המצעד").subscribe(t => {
        this.topic.title = t.title; this.topic.subtitle = t.subtitle;
        this.topic.icon = t.icon; this.topic.img = t.img;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
    this.navs.push("המצעד");
  }

  ngOnInit(): void {
  }

}
