import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  sectionName = "איזור מנהל";
  websiteName = "מיוזיק online";

  constructor() {
    document.getElementById("tabTitle").innerText = this.sectionName + " | " + this.websiteName;
  }

  ngOnInit(): void {
  }

}
