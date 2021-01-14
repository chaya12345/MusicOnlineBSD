import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material';
import { Observable } from 'rxjs';
import { startWith, map } from 'rxjs/operators';
import { AllTags } from '../classes/tag';
import { MessageComponent } from '../message/message.component';
import { TagService } from '../services/tag.service';

@Component({
  selector: 'deleting-tag',
  templateUrl: './deleting-tag.component.html',
  styleUrls: ['./deleting-tag.component.css']
})
export class DeletingTagComponent implements OnInit {

  @ViewChild("autoTags") autoTags: ElementRef;
  
  tagFormGroup: FormGroup;
  selectedTagName: string;
  tagsList: AllTags[] = [];
  filteredTags: Observable<AllTags[]>;
  selectedTag: AllTags;

  constructor(private tagsService: TagService, private dialog: MatDialog) {
    this.tagFormGroup = new FormGroup({
      tag: new FormControl("", Validators.required)
    });
    this.getTags();
  }

  ngOnInit(): void {
  }

  confirm(): void {
    if (this.tagFormGroup.valid) {
      this.selectedTag;
      this.tagsList.forEach(tag => {
        if (tag.name == this.selectedTagName) {
          this.selectedTag = tag;
        }
      });
      this.openMessageDialog("האם אתה בטוח שברצונך למחוק את התגית '" + this.selectedTagName + "'?");
    }
  }

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.deleteTag();
      });
    } catch (err) { console.log(err); }
  }

  deleteTag(): void {
    try {
      this.tagsService.deleteTagForSong(this.selectedTag.id)
      .subscribe();
    } catch { }
  }

  getTags(): void {
    try {
      this.tagsService.getAllTags()
        .subscribe(tags => {
          this.tagsList = [];
          tags.forEach(tag => {
            if (tag.type == "song" || tag.type == "article") {
              this.tagsList.push(tag);
            }
          });
          this.orderByName(this.tagsList);
          this.updateTagsList();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  public updateTagsList(): void {
    this.filteredTags = this.tagFormGroup.controls.tag.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterTag(value))
      );
  }

  public _filterTag(value: string): AllTags[] {
    const filterValue = value.toLowerCase();
    return this.tagsList.filter(tag => tag.name.toLowerCase().includes(filterValue));
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  saveSelectedTag(name: string): void {
    this.selectedTagName = name;
  }

}
