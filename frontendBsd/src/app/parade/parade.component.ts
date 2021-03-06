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
  sectionName = "המצעד";
  websiteName = "מיוזיק online";

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
        document.getElementById("tabTitle").innerText = this.sectionName + " | " + this.websiteName;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
    this.navs.push(this.sectionName);
  }

  checkIsParadeActive(): void {
    try {
      this.paradeService.getLastParade()
        .subscribe(result => {
          this.isActive = result.isActive;
        },
          err => console.log(err));
    } catch (err) { console.log(err); }
  }

}