import { Component, Inject, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MatSnackBar, MAT_DIALOG_DATA } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { Report } from '../classes/report';
import { DialogData } from '../reporting/reporting.component';
import { ArticleService } from '../services/article.service';
import { ReportsService } from '../services/reports.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'reporting-dialog',
  templateUrl: './reporting-dialog.component.html',
  styleUrls: ['./reporting-dialog.component.css']
})
export class ReportingDialogComponent implements OnInit {

  songName: string = "";
  name: string = "";
  songId: number;
  reportingForm: FormGroup;
  report: Report;

  constructor(public dialogRef: MatDialogRef<ReportingDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private activatedRoute: ActivatedRoute, private songService: SongService,
    private articleService: ArticleService, private reportsService: ReportsService,
    private _snackBar: MatSnackBar) {
    this.reportingForm = new FormGroup({
      name: new FormControl("", [Validators.required, Validators.minLength(2)]),
      phone: new FormControl("", [Validators.required, Validators.minLength(7), Validators.maxLength(12)]),
      mail: new FormControl("", [Validators.email, Validators.required]),
      message: new FormControl("", [Validators.required, Validators.minLength(4)])
    })
  }

  ngOnInit() {
    this.songService.getSongById(parseInt(this.data.songId)).subscribe(song => this.songName = song.name, err => console.log(err));
  };

  onSubmit(){
    if (this.reportingForm.valid){
      this.report = new Report();
      this.report.name = this.reportingForm.controls.name.value;
      this.report.mail = this.reportingForm.controls.mail.value;
      this.report.phone = this.reportingForm.controls.phone.value;
      this.report.songId = parseInt(this.data.songId);
      this.report.message = this.reportingForm.controls.message.value;
      this.reportsService.addReport(this.report).subscribe();
      this.report = null;
      this.onNoClick();
      this.openSnackBar('הדיווח הועבר לטיפול');
    }
    else {
      this.openSnackBar('דיווח נכשל. נסה שוב מאוחר יותר');
      // TODO לעדכן את המנהל על ניסיון דיווח שנכשל
    }
  }

  onNoClick(): void {
    this.reportingForm.reset({ value: "" });
    this.dialogRef.close();
  }

  getNameErrorMessage() {
    return this.checkValidate(this.reportingForm.controls.name);
  }

  getPhoneErrorMessage() {
    return this.checkValidate(this.reportingForm.controls.phone);
  }

  getMailErrorMessage() {
    return this.checkValidate(this.reportingForm.controls.mail);
  }

  getMessageErrorMessage() {
    return this.checkValidate(this.reportingForm.controls.message);
  }

  checkValidate(field: AbstractControl) {
    if (field.hasError("minLength") || field.hasError("maxLength")) {
      return "ערך לא חוקי.";
    }
    else if (field.hasError("email")) {
      return "כתובת מייל לא חוקית.";
    }
    else if (field.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
