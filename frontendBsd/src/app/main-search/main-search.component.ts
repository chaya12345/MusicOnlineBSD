import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material';
import { Router } from '@angular/router';
import { AllTags } from '../classes/tag';
import { TagService } from '../services/tag.service';

export class GroupByType {
  typeName: string;
  list: AllTags[];
}

@Component({
  selector: 'main-search',
  templateUrl: './main-search.component.html',
  styleUrls: ['./main-search.component.css']
})
export class MainSearchComponent implements OnInit {

  tags: AllTags[];
  list: GroupByType[] = [];
  tagControl: FormControl;

  constructor(public dialogRef: MatDialogRef<MainSearchComponent>,
    public tagService: TagService, private router: Router) {
    this.getAllTags();
    this.tagControl = new FormControl("", Validators.required);
  }

  ngOnInit(): void {
  }

  search(): void {
    this.router.navigateByUrl("song?filter=" + this.tagControl.value).finally(() => window.location.reload());
    this.dialogRef.close();
  }

  onNoClick(): void {
    this.tagControl.reset({ value: "" });
    this.dialogRef.close();
  }

  updateSelecting(tag: AllTags): void {
    this.tagControl.setValue(tag.name);
  }

  getAllTags(): void {
    try {
      this.tagService.getAllTags()
        .subscribe(tags => {
          this.tags = tags;
          this.groupingByTag();
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  groupingByTag() {
    this.list = [];
    this.tags.forEach(tag => {
      if (tag.type == "singer")
        this.addTagToGroupTag("זמרים", tag);
      else if (tag.type == "artist")
        this.addTagToGroupTag("אומנים", tag);
      else if (tag.type == "article")
        this.addTagToGroupTag("תגיות מעניינות", tag);
      else if (tag.type == "song")
        this.addTagToGroupTag(tag.tagType, tag);
    });
    this.joinVocally();
    this.orderGroups();
    this.orderLists();
  }

  orderLists(): void {
    this.list.forEach(group => {
      group.list.sort((a, b) => a.name.localeCompare(b.name));
    });
  }

  orderGroups(): void {
    this.list.sort((a, b) => a.typeName.localeCompare(b.typeName));
  }

  joinVocally(): void {
    this.list.some(item => {
      if (item.typeName == "אקפלה") {
        this.list.some(group => {
          if (group.typeName == "כללי") {
            group.list = group.list.concat(item.list);
            this.list.splice(this.list.indexOf(item), 1);
          }
        });
      }
    });
  }

  addTagToGroupTag(subGroup: string, tag: AllTags): void {
    let exist: boolean = false;
    this.list.forEach(group => {
      if (group.typeName == subGroup) {
        group.list.push(tag);
        exist = true;
      }
    });
    if (exist == false) {
      let g = new GroupByType();
      g.typeName = subGroup;
      g.list = [];
      g.list.push(tag);
      this.list.push(g);
    }
  }

}
