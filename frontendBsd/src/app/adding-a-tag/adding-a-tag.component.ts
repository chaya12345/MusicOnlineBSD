import { Component, OnInit } from '@angular/core';
import { map, startWith } from 'rxjs/operators';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { TagsForArticles, TagsForSongs, TypesOfTags } from '../classes/tag';
import { TypesOfTagService } from '../services/types-of-tag.service';
import { Observable } from 'rxjs';
import { TagService } from '../services/tag.service';

@Component({
  selector: 'adding-a-tag',
  templateUrl: './adding-a-tag.component.html',
  styleUrls: ['./adding-a-tag.component.css']
})
export class AddingATagComponent implements OnInit {

  nameFormGroup: FormGroup;
  typeFormGroup: FormGroup;
  typeTag;
  isSongTag: boolean = false;

  selectedTypeName: string;
  typesList: TypesOfTags[] = [];
  filteredTypes: Observable<TypesOfTags[]>;

  constructor(private typesOfTagService: TypesOfTagService, private tagsService: TagService,
    private tagsForArticles: TagsForArticles) {
    this.nameFormGroup = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2)])
    });
    this.typeFormGroup = new FormGroup({
      option: new FormControl("", Validators.required),
      type: new FormControl("")
    });
    this.getTypes();
  }

  ngOnInit(): void {
  }

  confirm(): void {
    if (this.nameFormGroup.valid && this.typeFormGroup.valid) {
      try {
        if (this.isSongTag == true) {
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
          this.updateSingersList();
        }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  public updateSingersList(): void {
    this.filteredTypes = this.typeFormGroup.controls.type.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSingers(value: string): TypesOfTags[] {
    const filterValue = value.toLowerCase();
    return this.typesList.filter(type => type.name.toLowerCase().includes(filterValue));
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  saveSelectedType(name: string): void {
    this.selectedTypeName = name;
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
