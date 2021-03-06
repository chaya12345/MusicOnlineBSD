import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'content',
  templateUrl: './content.component.html',
  styleUrls: ['./content.component.css']
})
export class ContentComponent implements OnInit {

  constructor() {
    document.getElementById("tabTitle").innerText = "מיוזיק online | בכל סגנון שתבחרו";
  }

  ngOnInit(): void {
    document.getElementById("tabTitle").innerText = "מיוזיק online | בכל סגנון שתבחרו";
  }

}
