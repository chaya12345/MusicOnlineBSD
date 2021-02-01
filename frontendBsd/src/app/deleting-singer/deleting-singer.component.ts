import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { map, startWith } from 'rxjs/operators';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';
import { MessageComponent } from '../message/message.component';
import { MatDialog, MatSnackBar } from '@angular/material';
import { CommonMessageService } from '../services/common-message.service';

@Component({
  selector: 'deleting-singer',
  templateUrl: './deleting-singer.component.html',
  styleUrls: ['./deleting-singer.component.css']
})
export class DeletingSingerComponent implements OnInit {

  @ViewChild("autoSingers") autoSingers: ElementRef;

  filteredSingers: Observable<Singer[]>;
  singersControl = new FormControl();
  singersList: Singer[] = [];

  singerFormGroup: FormGroup;
  selectedSingerName: string;
  selectedSinger: Singer;

  constructor(private singerService: SingerService, private dialog: MatDialog,
    private _snackBar: MatSnackBar, private cmService: CommonMessageService) {
    this.singerFormGroup = new FormGroup({
      singer: new FormControl("", Validators.required)
    });
    this.getSingers();
  }

  ngOnInit(): void {
  }

  getSingers(): void {
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

  public updateSingersList(): void {
    this.filteredSingers = this.singerFormGroup.controls.singer.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSingers(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.singersList.filter(singer => singer.name.toLowerCase().includes(filterValue));
  }

  orderByName(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  saveSelectedSinger(name: string): void {
    this.selectedSingerName = name;
  }

  confirm(): void {
    for (let i = 0; i < this.singersList.length; i++) {
      if (this.singersList[i].name == this.selectedSingerName) {
        this.selectedSinger = this.singersList[i];
        break;
      }
    }
    this.openMessageDialog("האם אתה בטוח שברצונך למחוק את '" +
      this.selectedSingerName + "'?");
  }

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.deleteSinger();
      });
    } catch (err) { console.log(err); }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  deleteSinger(): void {
    try {
      this.singerService.deleteSinger(this.selectedSinger.id)
        .subscribe(res => this.openSnackBar(res ? this.cmService.GENERATE.REMOVE.SUCCESS :
          this.cmService.GENERATE.REMOVE.ERROR),
          () => this.openSnackBar(this.cmService.GENERATE.REMOVE.ERROR));
    } catch (err) { console.log(err); }
  }

  getSingerErrorMessage(): string {
    let message: string = this.getError(this.singerFormGroup.controls.singer);
    if (message != "") return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    return "";
  }

}
