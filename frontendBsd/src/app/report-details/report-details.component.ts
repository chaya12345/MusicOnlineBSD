import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { Report, ReportView } from '../classes/report';
import { Song } from '../classes/song';
import { DialogData } from '../reporting/reporting.component';
import { ReportDetailsDialog, ReportsBoardComponent } from '../reports-board/reports-board.component';
import { SongService } from '../services/song.service';

@Component({
  selector: 'report-details',
  templateUrl: './report-details.component.html',
  styleUrls: ['./report-details.component.css']
})
export class ReportDetailsComponent implements OnInit {

  report: ReportView;

  constructor(public dialogRef: MatDialogRef<ReportDetailsComponent>,
    @Inject(MAT_DIALOG_DATA) public data: ReportDetailsDialog) {
    this.report = this.data.report;
  }

  ngOnInit(): void {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
