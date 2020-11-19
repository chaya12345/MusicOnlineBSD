import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { map, startWith } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';

export enum Type {
  email,
  name,
  singers
}

@Component({
  selector: 'field-form',
  templateUrl: './field-form.component.html',
  styleUrls: ['./field-form.component.css']
})

export class FieldFormComponent implements OnInit {

  message: string = "";
  type: Type;
  singer: Singer;
  currentSinger: string;
  email: FormControl = new FormControl("", [Validators.required, Validators.email]);
  name: FormControl = new FormControl("", [Validators.required, Validators.minLength(2)]);

  filteredSingers: Observable<Singer[]>;
  singersControl = new FormControl();
  singersList: Singer[] = [];

  constructor(public dialogRef: MatDialogRef<FieldFormComponent>,
    @Inject(MAT_DIALOG_DATA) public data: FieldFormComponent, public dialog: MatDialog,
    private singerService: SingerService) {
    if (this.data.type == Type.singers) {
      this.singersControl = new FormControl();
      try {
        this.singerService.getSingers()
          .subscribe(singers => {
            this.singersList = singers;
            this.orderByName(this.singersList);
            this.updateSingersList();
          }, err => { console.log(err); });
      }
      catch (err) { console.log(err); }
    }
  }

  ngOnInit(): void {
    this.message = this.data.message;
    this.type = this.data.type;
    this.singer = this.data.singer;
    this.currentSinger = this.singer.name;
  }

  public updateSingersList(): void {
    this.filteredSingers = this.singersControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSingers(value: string): Singer[] {
    console.log("value");
    console.log(value);
    const filterValue = value.toLowerCase();
    return this.singersList.filter(singer => singer.name.toLowerCase().includes(filterValue));
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  onNoClick(): void {
    this.dialogRef.close();
    this.email.reset({ value: "" });
    this.name.reset({ value: "" });
  }

  onSubmit(): void {
    if (this.type == Type.email && this.email.valid) {
      this.dialogRef.close(this.email.value);
    }
    else if (this.type == Type.name && this.name.valid) {
      this.dialogRef.close(this.name.value);
    }
    else if (this.type == Type.singers) {
      this.dialogRef.close(this.currentSinger);
    }
  }

  getMailErrorMessage() {
    if (this.email.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.email.hasError("email")) {
      return "כתובת מייל לא תקינה.";
    }
  }

  getNameErrorMessage() {
    if (this.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }

  fit(): string {
    return Type[this.type];
  }

}
