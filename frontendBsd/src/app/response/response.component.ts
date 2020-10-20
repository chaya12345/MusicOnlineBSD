import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'response',
  templateUrl: './response.component.html',
  styleUrls: ['./response.component.css']
})
export class ResponseComponent implements OnInit {

  @Input() response: any;
  id: number;

  constructor(public activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    if (this.activatedRoute.snapshot.paramMap.get('commitId') != (null || undefined)) {
      this.id = Number(this.activatedRoute.snapshot.paramMap.get('commitId'));
      if(this.response.id==this.id){
        //זה מה שנותן בקונסול
       // this.response = {id: 1044, songId: 71, name: "יאיר", title: "וווווווואו וואו וואו! ענקקקק!", content: "❤❤❤", …}

      }
    }
    //console.log(this.response.content == '');
  }

}
