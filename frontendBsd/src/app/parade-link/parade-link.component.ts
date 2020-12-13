import { Component, OnInit } from '@angular/core';
import { TopicsService } from '../services/topics.service';

@Component({
  selector: 'parade-link',
  templateUrl: './parade-link.component.html',
  styleUrls: ['./parade-link.component.css']
})
export class ParadeLinkComponent implements OnInit {

  // img: string = "";
  href: string = "";

  constructor(private topicsService: TopicsService) { 
    try {
      this.topicsService.getTopic("המצעד").subscribe(topic => {
        this.href = topic.href;
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }

}
