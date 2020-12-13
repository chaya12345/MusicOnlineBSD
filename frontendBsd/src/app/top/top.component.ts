import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'top',
  templateUrl: './top.component.html',
  styleUrls: ['./top.component.css']
})
export class TopComponent implements OnInit {

  @Input() img: string = '';
  @Input() _title: string;
  @Input() subtitle: string;
  @Input() date?: Date;
  @Input() icon?: string;
  @Input() notBlur?: boolean = false;
  imgFailed: boolean = false;
  isImage:boolean = false;

  constructor(private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    if (this.activatedRoute.snapshot.routeConfig.path.includes("playlist")) {
      (document.querySelector(".img") as HTMLElement).style.backgroundPosition = "bottom";
    }

    window.onscroll = function () {
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
    window.onscroll = function () {
      var currentScrollPos = window.pageYOffset;
      // 20 is an arbitrary number here, just to make you think if you need the prevScrollpos variable:
      if (currentScrollPos > 20) {
        // I am using 'display' instead of 'top':
        document.getElementById("top-scroll").style.height = "34vh";
      } else {
        document.getElementById("top-scroll").style.height = "55vh";
      }
    }
    this.imageExists();
    if (this.img == (null || undefined || "")||this.img == null || undefined || "")
      this.isImage = false;
    else this.isImage = true;
  }

  imageExists() {
    var img = new Image();
    img.src = this.img;
    img.onerror = () => {
      if (this.img != '' && this.img != null && this.img !== undefined) {
        this.imgFailed = true;
      }
    }
  }

}
