import { Component, OnInit } from '@angular/core';
import { TypeOfTag } from 'typescript';
import { AllTags } from '../classes/tag';
import { TagService } from '../services/tag.service';

export class GroupByType {
  typeName: string;
  list: AllTags[];
}

@Component({
  selector: 'searching-area',
  templateUrl: './searching-area.component.html',
  styleUrls: ['./searching-area.component.css']
})
export class SearchingAreaComponent implements OnInit {

  allTagsList: AllTags[] = [];
  groupByName: GroupByType[] = [];
  groupByType: GroupByType[] = [];

  constructor(private tagService: TagService) {
    this.getAllTags();
  }

  ngOnInit(): void {
  }

  getAllTags() {
    try {
      this.tagService.getAllTags().subscribe(
        tags => {
          this.allTagsList = tags;
          this.allTagsList.sort((a, b) => a.name.localeCompare(b.name));
          console.log(this.allTagsList);
          this.groupingByName();
          this.groupingByTag();
        }
        , err => console.log(err));
    } catch (err) { console.log(err); }
  }

  groupingByName() {
    this.allTagsList.forEach(tag => {
      if (tag.name.startsWith("א"))
        this.addTagToGroupName("א", tag);
      else if (tag.name.startsWith("ב"))
        this.addTagToGroupName("ב", tag);
      else if (tag.name.startsWith("ג"))
        this.addTagToGroupName("ג", tag);
      else if (tag.name.startsWith("ד"))
        this.addTagToGroupName("ד", tag);
      else if (tag.name.startsWith("ה"))
        this.addTagToGroupName("ה", tag);
      else if (tag.name.startsWith("ו"))
        this.addTagToGroupName("ו", tag);
      else if (tag.name.startsWith("ז"))
        this.addTagToGroupName("ז", tag);
      else if (tag.name.startsWith("ח"))
        this.addTagToGroupName("ח", tag);
      else if (tag.name.startsWith("ט"))
        this.addTagToGroupName("ט", tag);
      else if (tag.name.startsWith("י"))
        this.addTagToGroupName("י", tag);
      else if (tag.name.startsWith("כ"))
        this.addTagToGroupName("כ", tag);
      else if (tag.name.startsWith("ל"))
        this.addTagToGroupName("ל", tag);
      else if (tag.name.startsWith("מ"))
        this.addTagToGroupName("מ", tag);
      else if (tag.name.startsWith("נ"))
        this.addTagToGroupName("נ", tag);
      else if (tag.name.startsWith("ס"))
        this.addTagToGroupName("ס", tag);
      else if (tag.name.startsWith("ע"))
        this.addTagToGroupName("ע", tag);
      else if (tag.name.startsWith("פ"))
        this.addTagToGroupName("פ", tag);
      else if (tag.name.startsWith("ק"))
        this.addTagToGroupName("ק", tag);
      else if (tag.name.startsWith("צ"))
        this.addTagToGroupName("צ", tag);
      else if (tag.name.startsWith("ר"))
        this.addTagToGroupName("ר", tag);
      else if (tag.name.startsWith("ש"))
        this.addTagToGroupName("ש", tag);
      else if (tag.name.startsWith("ת"))
        this.addTagToGroupName("ת", tag);
    });
    console.log(this.groupByName);
  }

  addTagToGroupName(letter: string, tag: AllTags): void {
    let exist: boolean = false;
    this.groupByName.forEach(group => {
      if (group.typeName == letter) {
        group.list.push(tag);
        exist = true;
      }
    });
    if (exist == false) {
      let g = new GroupByType();
      g.typeName = letter;
      g.list = [];
      g.list.push(tag);
      this.groupByName.push(g);
    }
  }

  groupingByTag() {
    this.allTagsList.forEach(tag => {
      if (tag.type == "singer")
        this.addTagToGroupTag("זמרים", tag);
      else if (tag.type == "artist")
        this.addTagToGroupTag("אומנים", tag);
      else if (tag.type == "article")
        this.addTagToGroupTag("תגיות מעניינות", tag);
      else if (tag.type == "song") {
        if (tag.tagType == "ג'אנר")
          this.addTagToGroupTag("ג'אנר", tag);
        else if (tag.tagType == "מקצב")
          this.addTagToGroupTag("מקצב", tag);
        else if (tag.tagType == "נושא")
          this.addTagToGroupTag("נושא", tag);
        else if (tag.tagType == "אקפלה")
          this.addTagToGroupTag("אקפלה", tag);
        else if (tag.tagType == "סוג")
          this.addTagToGroupTag("סוג", tag);
        else if (tag.tagType == "כללי")
          this.addTagToGroupTag("כללי", tag);
        else if (tag.tagType == "אנשים")
          this.addTagToGroupTag("אנשים", tag);
      }
    });
    console.log(this.groupByType);
  }

  addTagToGroupTag(subGroup: string, tag: AllTags): void {
    let exist: boolean = false;
    this.groupByType.forEach(group => {
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
      this.groupByType.push(g);
    }
  }

}
