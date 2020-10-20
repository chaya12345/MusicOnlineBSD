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
        setTimeout(()=>{
          this.el.nativeElement.style.backgroundColor = "white";
          this.el.nativeElement.style.transition='all .6s ease'; 
        },2000)
        //this.accordion.openAll();
      }
    }
  }

}
