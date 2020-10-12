import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
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
  songId:number;
  reportingForm:FormGroup;
  newReport:Report=new Report;

  constructor(public dialogRef: MatDialogRef<ReportingDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private activatedRoute: ActivatedRoute, private songService: SongService,
    private articleService: ArticleService,private reportsService:ReportsService) {
      this.reportingForm=new FormGroup({
        name:new FormControl("",[Validators.required, Validators.minLength(2)]),
        phone:new FormControl("",[Validators.required, Validators.minLength(7), Validators.maxLength(12), Validators.pattern("/(0)\d{9}/")]),
        mail:new FormControl("",[Validators.email, Validators.required]),
        message:new FormControl("",[Validators.required, Validators.minLength(4)])
      })
     }

  ngOnInit() {
    console.log(this.data.songId +" g");
    this.songService.getSongById(parseInt(this.data.songId)).subscribe(song => {this.songName = song.name; console.log(this.songName); }, err => console.log(err));
  };
  onSubmit(){
    if(this.reportingForm.valid){
      // this.newReport.name=this.reportingForm.controls.name.value;
      // this.newReport.mail=this.reportingForm.controls.mail.value;
      // this.newReport.phone=this.reportingForm.controls.phone.value;
      // this.newReport.songId= 65; //Number(this.activatedRoute.snapshot.paramMap.get('id'));
      // this.newReport.message=this.reportingForm.controls.message.value;
      // this.newReport.status='לא טופל';
      // this.reportsService.addReport(this.newReport).subscribe();
      // this.newReport=null;
      // this.onNoClick();
      console.log("valid");
    }
    else {
      console.log("invalid");
    }
  }
  onNoClick(): void {
    this.reportingForm.reset({value:""});
    this.dialogRef.close();
  }

}
