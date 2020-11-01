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
  @Input() date?: Date;
  @Input() icon?: string;

  constructor(private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    if (this.activatedRoute.snapshot.routeConfig.path.includes("playlist")) {
      (document.querySelector(".img") as HTMLElement).style.backgroundPosition = "bottom";
    }
    
    window.onscroll = function() {
      var currentScrollPos = window.pageYOffset;
    
      // 20 is an arbitrary number here, just to make you think if you need the prevScrollpos variable:
      if (currentScrollPos > 20) {
        // I am using 'display' instead of 'top':
        document.getElementById("top-scroll").style.height = "34vh";
      } else {
        document.getElementById("top-scroll").style.height = "55vh";
      }
    }
  }

  ngOnChanges(): void {
    window.onscroll = function() {
      var currentScrollPos = window.pageYOffset;
    
      // 20 is an arbitrary number here, just to make you think if you need the prevScrollpos variable:
      if (currentScrollPos > 20) {
        // I am using 'display' instead of 'top':
        document.getElementById("top-scroll").style.height = "34vh";
      } else {
        document.getElementById("top-scroll").style.height = "55vh";
      }
    }
  }

  

}
