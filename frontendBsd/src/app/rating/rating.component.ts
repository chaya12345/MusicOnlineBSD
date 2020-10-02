import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'rating',
  templateUrl: './rating.component.html',
  styleUrls: ['./rating.component.css']
})
export class RatingComponent implements OnInit {

  @Input() likes?: number = 0;
  @Input() views?: number = 0;
  @Input() responses?: number = 0;

  constructor(private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    if (this.activatedRoute.snapshot.routeConfig.path.includes("playlist")) {
      var elements = document.getElementsByClassName("wrap-rating");
      for (let i = 0; i < elements.length; i++) {
        (elements[i] as HTMLElement).style.padding = "8px 17px";
      }
    }
  }

}
