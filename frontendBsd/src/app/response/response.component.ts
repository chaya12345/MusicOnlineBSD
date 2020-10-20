import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import { MatAccordion } from '@angular/material';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'response',
  templateUrl: './response.component.html',
  styleUrls: ['./response.component.css']
})
export class ResponseComponent implements OnInit {

  @Input() response: any;
  id: number;
  panelOpenState: boolean = false;
  @ViewChild('someVar') el:ElementRef;
  @ViewChild(MatAccordion) accordion: MatAccordion;

  constructor(public activatedRoute: ActivatedRoute) { }

  ngOnInit() {
  }
  
  ngAfterViewInit() {
    if (this.activatedRoute.snapshot.paramMap.get('commitId') != (null || undefined)) {
      this.id = Number(this.activatedRoute.snapshot.paramMap.get('commitId'));
      if(this.response.id == this.id) {
        this.el.nativeElement.scrollIntoView({
          behavior: "smooth" ,
          block:  "center",
          inline: "start",
        });
        setTimeout(() => {
          this.el.nativeElement.style.backgroundColor = "#fbc02d5c";
          this.el.nativeElement.style.transition = 'all .6s ease';
        }, 500);
        setTimeout(() => {
          this.el.nativeElement.style.backgroundColor = "white";
          this.el.nativeElement.style.transition = 'all .6s ease';
        }, 2500);
        this.panelOpenState = true;
      }
    }
  }

}
