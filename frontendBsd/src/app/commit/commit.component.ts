import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import { MatAccordion } from '@angular/material';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'commit',
  templateUrl: './commit.component.html',
  styleUrls: ['./commit.component.css']
})
export class CommitComponent implements OnInit {

  @Input() commit: any;
  id: number;
  panelOpenState: boolean = false;
  @ViewChild('someVar') el:ElementRef;
  @ViewChild(MatAccordion) accordion: MatAccordion;

  constructor(public activatedRoute: ActivatedRoute) { }

  ngOnInit() {
  }
  
  ngAfterViewInit() {
    if (this.activatedRoute.snapshot.queryParams.commitId) {
      this.id = this.activatedRoute.snapshot.queryParams.commitId;
      if(this.commit.id == this.id) {
        this.el.nativeElement.scrollIntoView({
          behavior: "smooth" ,
          block:  "center",
          inline: "start",
        });
        setTimeout(() => {
          this.el.nativeElement.style.backgroundColor = "#fbc02d5c";
          this.el.nativeElement.style.transition = 'all .6s ease';
          this.panelOpenState = true;
        }, 500);
        setTimeout(() => {
          this.el.nativeElement.style.backgroundColor = "white";
          this.el.nativeElement.style.transition = 'all .6s ease';
        }, 2500);
      }
    }
  }

}
