import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'profile-obj',
  templateUrl: './profile-obj.component.html',
  styleUrls: ['./profile-obj.component.css']
})
export class ProfileObjComponent implements OnInit {

  @Input() name: string = "";
  @Input() mail: string = "";
  @Input() img: string = "";

  constructor() { }

  ngOnInit(): void {
  }

}
