import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormControl, Validators, AbstractControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { startWith, map } from 'rxjs/operators';
import { TypesOfTags, AllTags, TagsForSongs, TagsForArticles } from '../classes/tag';
import { TagService } from '../services/tag.service';
import { TypesOfTagService } from '../services/types-of-tag.service';

@Component({
  selector: 'editing-tag',
  templateUrl: './editing-tag.component.html',
  styleUrls: ['./editing-tag.component.css']
})
export class EditingTagComponent implements OnInit {
  
  @ViewChild("autoTags") autoTags: ElementRef;
  @ViewChild("autoTypes") autoTypes: ElementRef;

  nameFormGroup: FormGroup;
  typeFormGroup: FormGroup;
  tagFormGroup: FormGroup;
  typeTag;
  isSongTag: boolean = false;

  selectedTypeName: string;
  typesList: TypesOfTags[] = [];
  filteredTypes: Observable<TypesOfTags[]>;

  selectedTagName: string;
  selectedTag: AllTags;
  tagsList: AllTags[] = [];
  filteredTags: Observable<AllTags[]>;

  constructor(private typesOfTagService: TypesOfTagService, private tagsService: TagService) {
    this.nameFormGroup = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2)])
    });
    this.typeFormGroup = new FormGroup({
      option: new FormControl("", Validators.required),
      type: new FormControl("")
    });
    this.tagFormGroup = new FormGroup({
      tag: new FormControl("", Validators.required)
    });
    this.getTags();
    this.getTypes();
  }

  ngOnInit(): void {
  }

  confirm(): void {
    if (this.tagFormGroup.valid && this.nameFormGroup.valid && this.typeFormGroup.valid) {
      try {
        if (this.isSongTag == (this.selectedTag.type == "song")) {
          let tag: TagsForSongs = new TagsForSongs;
          tag.name = this.nameFormGroup.controls.name.value;
          this.typesList.forEach(type => {
            if (type.name == this.typeFormGroup.controls.type.value) {
              tag.typeId = type.id;
            }
          });
          this.tagsService.addTagForSong(tag)
            .subscribe();
        }
        else {
          let tag: TagsForArticles = new TagsForArticles;
          tag.name = this.nameFormGroup.controls.name.value;
          this.tagsService.addTagForArticle(tag)
            .subscribe();
        }
      } catch { }
    }
  }

  updatedType(value): void {
    if (value == "song") {
      this.isSongTag = true;
      this.typeFormGroup.controls.type.setValidators(Validators.required);
    }
    else {
      this.typeFormGroup.controls.type.clearValidators();
      this.typeFormGroup.controls.type.updateValueAndValidity();
      this.isSongTag = false;
    }
  }

  getTypes(): void {
    try {
      this.typesOfTagService.getTypesOfTags()
        .subscribe(types => {
          this.typesList = types;
          this.orderByName(this.typesList);
          this.updateTypesList();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  public updateTypesList(): void {
    this.filteredTypes = this.typeFormGroup.controls.type.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterTags(value))
      );
  }

  public _filterTags(value: string): TypesOfTags[] {
    const filterValue = value.toLowerCase();
    return this.typesList.filter(type => type.name.toLowerCase().includes(filterValue));
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

  saveSelectedType(name: string): void {
    this.selectedTypeName = name;
  }

  saveSelectedTag(name: string): void {
    this.selectedTagName = name;
    this.tagsList.forEach(tag => {
      if (tag.name == name) {
        this.selectedTag = tag;
      }
    });
    this.nameFormGroup.controls.name.setValue(this.selectedTag.name);
    this.typeFormGroup.controls.option.setValue(this.selectedTag.type);
    if (this.selectedTag.type == "song") {
      this.isSongTag = true;
      this.typeFormGroup.controls.type.setValidators(Validators.required);
      this.typeFormGroup.controls.type.setValue(this.selectedTag.tagType);
    }
    else {
      this.isSongTag = false;
    }
    console.log(this.selectedTag);
  }

  getNameErrorMessage(): string {
    let message: string = this.getError(this.nameFormGroup.controls.name);
    if (message != "") return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    else if (field.hasError("minlength"))
      return "שם לא תקין. (מינימום 2 תווים)";
    else if (field.hasError("maxLength"))
      return "שם חורג ממגבלת התווים"
    return "";
  }

}
