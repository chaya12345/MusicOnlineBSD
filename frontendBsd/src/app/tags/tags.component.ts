import { Component, Input, OnInit } from '@angular/core';
import { AllTags } from '../classes/tag';
import { GroupByType } from '../searching-area/searching-area.component';

@Component({
  selector: 'tags',
  templateUrl: './tags.component.html',
  styleUrls: ['./tags.component.css']
})
export class TagsComponent implements OnInit {

  @Input() tagsList?: string[] = [];
  @Input() groupTag?: GroupByType = null;

  constructor() {
  }

  ngOnInit() {
  }
  ngOnChanges() {
    if (this.tagsList != null)
      console.log(this.tagsList);
  }

}
