import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'content-management',
  templateUrl: './content-management.component.html',
  styleUrls: ['./content-management.component.css']
})
export class ContentManagementComponent implements OnInit {

  @ViewChild('song') song: ElementRef;
  @ViewChild('article') article: ElementRef;
  @ViewChild('playlist') playlist: ElementRef;
  @ViewChild('parade') parade: ElementRef;
  @ViewChild('commits') commits: ElementRef;
  @ViewChild('deleting') deleting: ElementRef;
  @ViewChild('reports') reports: ElementRef;

  constructor() { }

  ngOnInit(): void {
  }

  scrollToElement($element): void {
    console.log($element);
    // this.playlist.nativeElement.scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
    let state = window.pageYOffset;
    window.scrollTo(0, state += 500);
    $element.scrollIntoView({ behavior: "smooth", block: "start" });
    // const elementRect = $element.getBoundingClientRect();
    // const absoluteElementTop = elementRect.top + window.pageYOffset;
    // const middle = absoluteElementTop - (elementRect.height / 2);  
    // window.scrollTo(0, middle - 200);

    // let state = window.pageYOffset;
    // let scrolling = setInterval(() => {
    //   if (this.elementInViewport($element) == false) {
    //     window.scrollTo(0, state += 10);
    //   }
    //   else {
    //     clearInterval(scrolling);
    //   }
    // }, 100);

  }

  elementInViewport(el): boolean {
    var top = el.offsetTop;
    var left = el.offsetLeft;
    var width = el.offsetWidth;
    var height = el.offsetHeight;

    while (el.offsetParent) {
      el = el.offsetParent;
      top += el.offsetTop;
      left += el.offsetLeft;
    }

    return (
      top >= window.pageYOffset &&
      left >= window.pageXOffset &&
      (top + height) <= (window.pageYOffset + window.innerHeight) &&
      (left + width) <= (window.pageXOffset + window.innerWidth)
    );
  }

}
