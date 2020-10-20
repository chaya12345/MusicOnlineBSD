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
  @ViewChild('someVar') el:ElementRef;
  @ViewChild(MatAccordion) accordion: MatAccordion;

  constructor(public activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    if (this.activatedRoute.snapshot.paramMap.get('commitId') != (null || undefined)) {
      this.id = Number(this.activatedRoute.snapshot.paramMap.get('commitId'));
      if(this.response.id==this.id){
        //זה מה שנותן בקונסול
       // this.response = {id: 1044, songId: 71, name: "יאיר", title: "וווווווואו וואו וואו! ענקקקק!", content: "❤❤❤", …}
      }
    }
  }
  
  ngAfterViewInit() {
    console.log(this.el);
    if (this.activatedRoute.snapshot.paramMap.get('commitId') != (null || undefined)) {
      this.id = Number(this.activatedRoute.snapshot.paramMap.get('commitId'));
      if(this.response.id==this.id) {
        console.log("yes");
        console.log(this.el);
        console.log("----------");
        this.el.nativeElement.scrollIntoView();
        this.el.nativeElement.style.backgroundColor = "whitesmoke";
        this.accordion.openAll();
      }
    }
  }

}
