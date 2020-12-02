import { Component, OnInit } from '@angular/core';
import { LastViews } from '../classes/lastViews';
import { LastViewsService } from '../services/last-views.service';

@Component({
  selector: 'f-viewed',
  templateUrl: './f-viewed.component.html',
  styleUrls: ['./f-viewed.component.css', './../f-style.css']
})
export class FViewedComponent implements OnInit {

  views: LastViews[] = [];

  constructor(private lastViewsService: LastViewsService) {
    this.getLastViews();
  }

  ngOnInit(): void {
  }

  getLastViews(): void {
    try {
      this.lastViewsService.getLastViews().subscribe(views => {
        this.views = views;
        this.views = this.views.slice(0, 5);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

}
