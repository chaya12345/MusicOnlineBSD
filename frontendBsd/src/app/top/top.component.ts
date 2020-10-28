import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'top',
  templateUrl: './top.component.html',
  styleUrls: ['./top.component.css']
})
export class TopComponent implements OnInit {

  @Input() img: string;
  @Input() _title: string;
  @Input() subtitle: string;
  @Input() icon?: string;
  @Input() biggerFont?: boolean = false;

  constructor(private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    if (this.activatedRoute.snapshot.routeConfig.path.includes("playlist")) {
      (document.querySelector(".img") as HTMLElement).style.backgroundPosition = "bottom";
    }
  }

}
