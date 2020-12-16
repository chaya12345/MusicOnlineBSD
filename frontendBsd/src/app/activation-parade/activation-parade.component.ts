import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { MessageComponent } from '../message/message.component';
import { CommonMessageService } from '../services/common-message.service';
import { ParadeService } from '../services/parade.service';
import { SingerService } from '../services/singer.service';
import { SongService } from '../services/song.service';
import { UploadService } from '../services/upload.service';

@Component({
  selector: 'activation-parade',
  templateUrl: './activation-parade.component.html',
  styleUrls: ['./activation-parade.component.css']
})
export class ActivationParadeComponent implements OnInit {

  activationParadeForm: FormGroup;
  singers: Singer[] = [];
  songs: Song[] = [];
  imageFile: File;
  activatedParade: boolean = false;

  constructor(private singerService: SingerService, private songService: SongService, public dialog: MatDialog,
    private uploadService: UploadService, private _snackBar: MatSnackBar, private paradeService: ParadeService,
    private commonMessage: CommonMessageService) {
    this.activationParadeForm = new FormGroup({
      image: new FormControl("", Validators.required),
      year: new FormControl("", Validators.required),
      songs: new FormControl("", Validators.required),
      singers: new FormControl("", Validators.required)
    });
    this.getSingers();
    this.getSongs();
    try {
      paradeService.getActiveParade().subscribe(parade => { if (parade != null) this.activatedParade = true })
    } catch (err) { console.log(err); }
  }

  ngOnInit(): void {
  }

  getSongs(): void {
    try {
      this.songService.getSongsPublishedThisYear().subscribe(songs => this.songs = songs, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getSingers(): void {
    try {
      this.singerService.getSingers().subscribe(singers => {
        this.singers = singers;
        this.sort(this.singers);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  sort(list: any[]): void {
    list.sort((a, b) => a.name.localeCompare(b.name));
  }

  getErrorMessage(): string {
    let message: string = this.getError(this.activationParadeForm.controls.singers);
    if (message != "") return message;
  }

  getError(field: AbstractControl) {
    if (field.hasError("required"))
      return "זהו שדה חובה.";
    return "";
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
    this.imageFile = fileToUpload;
    // this.managmentParade.controls.image.setValue("");
  }

  saveFile(filesToUpload: File[], folderName: string, folderName2?: string): void {
    if (filesToUpload != null) {
      this.uploadService.postFile(filesToUpload, folderName, folderName2).subscribe(
        res => console.log(res),
        error => console.log(error)
      );
    }
  }

  onSubmit() {
    if (this.activationParadeForm.valid) {
      this.openSnackBar("הפעלת המצעד בוצעה בהצלחה");
    }
    else {
      // this.openSnackBar("יש למלא את כל השדות כהלכה");
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }
  finishedParade() {
    try {
      this.paradeService.finishedParade().subscribe(
        suc => this.openSnackBar(this.commonMessage.FINISHED_PARADE.SUCCESS),
        err => this.commonMessage.FINISHED_PARADE.ERROR);
    } catch { this.commonMessage.FINISHED_PARADE.ERROR }

  }

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.finishedParade();
      });
    } catch (err) { console.log(err); }
  }

}
