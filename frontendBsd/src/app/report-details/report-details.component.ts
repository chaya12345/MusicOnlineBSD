import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MatSnackBar, MAT_DIALOG_DATA } from '@angular/material';
import { report } from 'process';
import { ReportView } from '../classes/report';
import { eStatus, ReportDetailsDialog } from '../reports-board/reports-board.component';
import { CommonMessageService } from '../services/common-message.service';
import { ReportsService } from '../services/reports.service';
import { ShareDataService } from '../services/share-data.service';

@Component({
  selector: 'report-details',
  templateUrl: './report-details.component.html',
  styleUrls: ['./report-details.component.css']
})
export class ReportDetailsComponent implements OnInit {

  report: ReportView = new ReportView;

  constructor(public dialogRef: MatDialogRef<ReportDetailsComponent>,
    @Inject(MAT_DIALOG_DATA) public data: ReportDetailsDialog,
    private reportService: ReportsService, private _snackBar: MatSnackBar,
    private commonMessage: CommonMessageService,
    private shareDataService: ShareDataService) {
    this.report = this.data.report;
    if (this.report.status == 1) {
      this.changeStatusToInTreatment();
    }
  }

  ngOnInit(): void {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

  changeStatusToInTreatment(): void {
    try {
      this.reportService.updateReportStatus(this.report.id, 2)
        .subscribe(result => {
          if (result == true) {
            this.report.status = 2;
            this.shareDataService.emitStatusChanged(this.report);
          }
        });
    } catch (err) { console.log(err); }
  }

  changeStatusToggle(): void {
    try {
      let wantedStatus = this.report.status != 3 ? 3 : 2;
      let newReport: ReportView = new ReportView();
      newReport = this.report;
      newReport.status = wantedStatus;
      this.reportService.updateReportStatus(this.report.id, wantedStatus)
        .subscribe(result => {
          this.openSnackBar(result == true ?
            this.commonMessage.CHANGE_STATUS.SUCCESS :
            this.commonMessage.CHANGE_STATUS.FAIL);
          this.shareDataService.emitStatusChanged(newReport);
        }, () => this.openSnackBar(this.commonMessage.CHANGE_STATUS.ERROR));
    } catch (err) { this.openSnackBar(this.commonMessage.CHANGE_STATUS.ERROR); }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

}
