import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';
import { UploadService } from '../services/upload.service';
import { MatDialog, MatSnackBar } from '@angular/material';
import { CommonMessageService } from '../services/common-message.service';
import { MessageComponent } from '../message/message.component';

@Component({
  selector: 'adding-singer',
  templateUrl: './adding-singer.component.html',
  styleUrls: ['./adding-singer.component.css', './../admin-style.css']
})
export class AddingSingerComponent implements OnInit {

  singerAddingForm: FormGroup;
  isEdit: boolean = false;
  
  filteredSingers: Observable<Singer[]>;
  singers: Singer[] = [];
  singerControl = new FormControl();
  SelectedSinger: Singer;
  image: string = null;
  imageFile: File;

  constructor(private singerService: SingerService, private uploadService: UploadService,
    private _snackBar: MatSnackBar, private cmService: CommonMessageService,
    private dialog: MatDialog) {
    this.singerAddingForm = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(3)]),
      image: new FormControl("", Validators.required)
    });
    this.getSingers();
   }

  ngOnInit(): void {
  }

  onSubmit(): void {
    if (this.singerAddingForm.valid && this.imageFile != null && this.imageFile != undefined && this.isEdit == false) {
      let newSinger: Singer = new Singer;
      newSinger.name = this.singerAddingForm.controls.name.value;
      newSinger.image = this.singerAddingForm.controls.image.value;
      try {
        this.singerService.addSinger(newSinger).subscribe(res => {
          this.openSnackBar(res==true? this.cmService.GENERATE.ADD.SUCCESS:this.cmService.GENERATE.ADD.FAIL);
          this.saveImage(this.imageFile);
        }, () => this.openSnackBar(this.cmService.GENERATE.ADD.ERROR));
        this.getSingers();
      } catch { this.openSnackBar(this.cmService.GENERATE.ADD.ERROR); }
      this.reset();
    }
  }

  reset() {
    this.singerAddingForm.reset({ value: "" });
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

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    this.singerAddingForm.controls.image.setValue("singers/" + fileToUpload.name);
  }

  saveImage(fileToUpload: File): void {
    if (fileToUpload != null) {
      this.uploadService.postFile([fileToUpload], "images//singers").subscribe(
        res => console.log(res),
        error => console.log(error)
      );
    }
  }

  saveChanges(): void {
    if (this.singerAddingForm.valid == false)
      return;
    try {
      let singer = new Singer;
      singer.id = this.SelectedSinger.id;
      singer.name = this.singerAddingForm.controls.name.value;
      singer.image = this.singerAddingForm.controls.image.value;
      this.singerService.updateSinger(singer)
      .subscribe(res => {
        if (singer.image != this.SelectedSinger.image)
          this.saveImage(this.imageFile);
        this.openSnackBar(this.cmService.UPDATE_ITEM.SUCCESS);
        this.getSingers();
        this.reset();
      }, () => this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR));
    } catch { this.openSnackBar(this.cmService.UPDATE_ITEM.ERROR); }
  }

  public updateSingers(): void {
    this.filteredSingers = this.singerControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterPlaylists(value))
      );
  }

  public _filterPlaylists(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.singers.filter(playlist => playlist.name.toLowerCase().includes(filterValue));
  }

  onSelectionChange(event): void {
    this.singers.forEach(singer => {
      if (singer.name == event.option.value) {
        this.SelectedSinger = singer;
      }
    });
    this.singerAddingForm.controls.name.setValue(this.SelectedSinger.name);
    this.singerAddingForm.controls.image.setValue(this.SelectedSinger.image);
    this.image = '../../assets/images/' + this.SelectedSinger.image;
  }

  getSingers(): void {
    try {
      this.singerService.getSingers()
      .subscribe(singers => {
        this.singers = singers;
        this.singers.sort((a, b) => a.name.localeCompare(b.name));
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getNameErrorMessage() {
    if (this.singerAddingForm.controls.name.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.singerAddingForm.controls.name.hasError("minlength")) {
      return "שם לא תקין. (פחות מ-3 תווים)"
    }
  }

}
