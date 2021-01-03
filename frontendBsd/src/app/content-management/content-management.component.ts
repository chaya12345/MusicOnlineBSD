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
    $element.scrollIntoView({ behavior: "smooth", block: "start" });
    // const elementRect = $element.getBoundingClientRect();
    // const absoluteElementTop = elementRect.top + window.pageYOffset;
    // const middle = absoluteElementTop - (elementRect.height / 2);  
    // window.scrollTo(0, middle - 200);
  }

}
