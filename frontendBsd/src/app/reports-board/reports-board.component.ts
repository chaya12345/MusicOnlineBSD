import { Component, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Report, ReportView } from '../classes/report';
import { MessageComponent } from '../message/message.component';
import { ReportDetailsComponent } from '../report-details/report-details.component';
import { CommonMessageService } from '../services/common-message.service';
import { ReportsService } from '../services/reports.service';

export enum eStatus { "לא טופל" = 1, "בטיפול", "טופל" }
export interface ReportDetailsDialog {
  report: ReportView;
}

@Component({
  selector: 'reports-board',
  templateUrl: './reports-board.component.html',
  styleUrls: ['./reports-board.component.css']
})
export class ReportsBoardComponent implements OnInit {

  reports: ReportView[] = [];
  selectedReport: Report = null;

  report: ReportView;

  constructor(private reportService: ReportsService, public dialog: MatDialog, private _snackBar: MatSnackBar,
    private cmService: CommonMessageService) {
    this.getReports();
  }

  ngOnInit(): void {
  }

  prevent(event): void {
    event.stopPropagation();
  }

  getReports(): void {
    try {
      this.reportService.getReportsView()
        .subscribe(reports => {
          this.reports = reports;
          this.reports.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getStatus(value: number): string {
    return eStatus[value];
  }

  getIcon(value: number): string {
    return value == 1 ? "mark_email_unread" : (value == 2 ? "more_horiz" : "mark_email_read");
  }

  updateStatus(report: ReportView, status: number): void {
    try {
      this.reportService.updateReportStatus(report.id, status).subscribe(() => {
        this.getReports();
        if (report == this.selectedReport) {
          this.selectedReport.status = eStatus[status];
        }
        this.openSnackBar(this.cmService.CHANGE_STATUS.SUCCESS);
      });
    } catch (err) { console.log(err); this.openSnackBar(this.cmService.CHANGE_STATUS.ERROR); }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  openReportDetailsDialog(report: ReportView): void {
    try {
      const dialogRef = this.dialog.open(ReportDetailsComponent, {
        width: '350px',
        data: { report: report }
      });

      dialogRef.componentInstance.data.report = report;
      dialogRef.afterClosed().subscribe(result => {
      });
    }
    catch (err) { console.log(err); }
  }
  openMessageDialog(text: string, report: ReportView) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.updateStatus(report, eStatus.טופל);
      });
    } catch (err) { console.log(err); }
  }

}
