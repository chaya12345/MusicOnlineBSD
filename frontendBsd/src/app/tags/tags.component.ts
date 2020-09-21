import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'tags',
  templateUrl: './tags.component.html',
  styleUrls: ['./tags.component.css']
})
export class TagsComponent implements OnInit {

  @Input() tagsList: string[] = [];

  constructor() { }

  ngOnInit() {
  }

}
