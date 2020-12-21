import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { TagsForArticles, TagsForSongs, TypesOfTags } from '../classes/tag';
import { MessageComponent } from '../message/message.component';
import { CommonMessageService } from '../services/common-message.service';
import { TagService } from '../services/tag.service';
import { TypesOfTagService } from '../services/types-of-tag.service';

@Component({
  selector: 'adding-tag',
  templateUrl: './adding-tag.component.html',
  styleUrls: ['./adding-tag.component.css', './../admin-style.css']
})
export class AddingTagComponent implements OnInit {

  tagAddingForm: FormGroup;
  isEdit: boolean = false;

  filteredTags: Observable<TagsForSongs[]>;
  tags: TagsForSongs[] = [];
  tagControl = new FormControl();
  SelectedTag: TagsForSongs;
  typeOfTag: TypesOfTags[] = [];
  tagFor: "song" | "article" = "song";

  constructor(private tagService: TagService, private dialog: MatDialog, private typesOfTagService: TypesOfTagService,
    private _snackBar: MatSnackBar, private cmService: CommonMessageService) {
    this.tagAddingForm = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)]),
      type: new FormControl("", Validators.required)
    });
    this.getTags();
    this.getTypeOfTag();
    this.tagFor = "article"
  }

  ngOnInit(): void {
  }

  onSubmit(): void {
    if (this.tagAddingForm.controls.name.valid && this.isEdit == false) {
      if (this.tagFor == "song")
        this.addTagToSong();
      else if (this.tagFor == "article")
        this.addTagToArticle();
    }
  }

  addTagToSong() {
    if (this.tagAddingForm.controls.type.valid) {
      let newTag: TagsForSongs = new TagsForSongs;
      newTag.name = this.tagAddingForm.controls.name.value;
      newTag.typeId = this.getTypseTagId(this.tagAddingForm.controls.type.value);
      try {
        this.tagService.addTagForSong(newTag).subscribe(res => {
          this.openSnackBar(this.cmService.GENERATE.ADD.SUCCESS);
          this.getTags();
          this.reset();
        }, () => this.openSnackBar(this.cmService.GENERATE.ADD.ERROR));
      } catch { this.openSnackBar(this.cmService.GENERATE.ADD.ERROR); }
      this.reset();
    }
  }

  addTagToArticle() {
    let newTag: TagsForArticles = new TagsForArticles;
    newTag.name = this.tagAddingForm.controls.name.value;
    try {
      this.tagService.addTagForArticle(newTag).subscribe(res => {
        this.openSnackBar(this.cmService.GENERATE.ADD.SUCCESS);
        this.getTags();
        this.reset();
      }, () => this.openSnackBar(this.cmService.GENERATE.ADD.ERROR));
    } catch { this.openSnackBar(this.cmService.GENERATE.ADD.ERROR); }
    this.reset();
  }

  reset() {
    this.tagAddingForm.reset({ value: "" });
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.saveChanges();
      });
    } catch (err) { console.log(err); }
  }

  saveChanges(): void {
    if (this.tagAddingForm.valid == false)
      return;
    if (this.tagFor == "song")
      this.updateTagForSong();
    else if (this.tagFor == "article")
      this.updateTagForArticle()
  }

  updateTagForSong() {
    try {
      let tag = new TagsForSongs;
      tag.id = this.SelectedTag.id;
      tag.name = this.tagAddingForm.controls.name.value;
      tag.typeId = this.getTypseTagId(this.tagAddingForm.controls.type.value);
      this.tagService.updateTagForSong(tag)
        .subscribe(res => {
          this.openSnackBar(this.cmService.UPDATE_ITEM.SUCCESS);
          this.getTags();
        }, () => this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR));
    } catch { this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR); }
  }

  updateTagForArticle() {
    try {
      let tag = new TagsForArticles;
      tag.id = this.SelectedTag.id;
      tag.name = this.tagAddingForm.controls.name.value;
      this.tagService.updateTagForArticle(tag)
        .subscribe(res => {
          this.openSnackBar(this.cmService.UPDATE_ITEM.SUCCESS);
          this.getTags();
        }, () => this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR));
    } catch { this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR); }
  }

  public updateArtist(): void {
    this.filteredTags = this.tagControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterTagName(value))
      );
  }

  public _filterTagName(value: string): TagsForSongs[] {
    const filterValue = value.toLowerCase();
    return this.tags.filter(tag => tag.name.toLowerCase().includes(filterValue));
  }

  onSelectionChange(event): void {
    this.tags.forEach(tag => {
      if (tag.name == event.option.value) {
        this.SelectedTag = tag;
      }
    });
    this.tagAddingForm.controls.name.setValue(this.SelectedTag.name);
    this.tagAddingForm.controls.type.setValue(this.getTypseTagName(this.SelectedTag.typeId));
  }

  onSelectionTagType(event): void {
    this.typeOfTag.forEach(type => {
      if (type.name == event.option.value) {
        this.tagAddingForm.controls.type.setValue(type.name);
        return;
      }
    });
  }

  getTags(): void {
    try {
      this.tagService.getTagsForSongs()
        .subscribe(tags => {
          this.tags = tags;
          this.tags.sort((a, b) => a.name.localeCompare(b.name));
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getTypeOfTag(): void {
    try {
      this.typesOfTagService.getTypesOfTags().subscribe(types => this.typeOfTag = types, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getTypseTagId(type: string): number {
    for (let item of this.typeOfTag) {
      if (item.name == type)
        return item.id;
    }
    return;
  }

  getTypseTagName(typeId: number): string {
    for (let item of this.typeOfTag) {
      if (item.id == typeId)
        return item.name;
    }
    return;
  }

  getNameErrorMessage() {
    if (this.tagAddingForm.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.tagAddingForm.controls.name.hasError("minlength")) {
      return "שם לא תקין. (פחות מ-3 תווים)"
    }
  }
  getTypeErrorMessage() {
    if (this.tagAddingForm.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }

}
