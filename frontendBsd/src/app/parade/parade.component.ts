import { Component, OnInit } from '@angular/core';
import { Topics } from '../classes/topics';
import { ParadeService } from '../services/parade.service';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'parade',
  templateUrl: './parade.component.html',
  styleUrls: ['./parade.component.css']
})
export class ParadeComponent implements OnInit {

  isActive: boolean = null;
  topic: Topics = new Topics();
  navs: string[] = [];

  constructor(private topicsService: TopicsService, private paradeService: ParadeService) { 
    this.getDetailsTopic();
    this.checkIsParadeActive();
  }

  ngOnInit(): void {
  }

  getDetailsTopic(): void {
    try {
      this.topicsService.getTopic("המצעד").subscribe(t => {
        this.topic.title = t.title; this.topic.subtitle = t.subtitle;
       // this.topic.icon = t.icon; this.topic.img = t.img;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
    this.navs.push("המצעד");
  }

  checkIsParadeActive(): void {
    try {
      this.paradeService.getActiveParade()
      .subscribe(result => {
        this.isActive = result != null ? true : false
        console.log(this.isActive + ">>>>>>>>>>>>>>>>>>")
      },
        err => console.log(err));
    } catch (err) { console.log(err); }
  }

}