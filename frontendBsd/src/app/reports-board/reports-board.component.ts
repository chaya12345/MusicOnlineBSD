import { Component, OnInit } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { Report, ReportView } from '../classes/report';
import { MessageComponent } from '../message/message.component';
import { ReportDetailsComponent } from '../report-details/report-details.component';
import { CommonMessageService } from '../services/common-message.service';
import { ReportsService } from '../services/reports.service';
import { ShareDataService } from '../services/share-data.service';

export enum eStatus { "לא טופל" = 1, "בטיפול", "טופל" }
// export enum eStatus { not_treated = 1, in_treatment, treated }
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
  selectedReport: ReportView = null;

  reports_pre: ReportView[] = [];
  reports_in: ReportView[] = [];
  reports_post: ReportView[] = [];
  isShowTreated: boolean = false;

  report: ReportView;

  constructor(private reportService: ReportsService, public dialog: MatDialog,
    private _snackBar: MatSnackBar, private cmService: CommonMessageService,
    private shareDataService: ShareDataService) {
    this.getReports();
  }

  ngOnInit(): void {
    this.shareDataService.statusChangedEventListner()
      .subscribe(report => {
        let placing = this.findReportById(report.id);
        if (placing > 0 && placing <= this.reports.length) {
          this.reports[placing].status = report.status;
          this.sortToLists();
        }
      });
  }

  prevent(event): void {
    event.stopPropagation();
  }

  getReports(): void {
    try {
      this.reportService.getReportsView()
        .subscribe(reports => {
          this.reports = reports;
          this.reports = this.sortByDate(this.reports);
          this.sortToLists();
        }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  sortByDate(list: ReportView[]): ReportView[] {
    return list.sort((a, b) =>
      Math.round(new Date(b.date).getTime() -
        new Date(a.date).getTime()));
  }

  sortToLists(): void {
    this.reports_pre = [];
    this.reports_in = [];
    this.reports_post = [];
    this.reports.forEach(report => {
      switch (report.status) {
        case eStatus['לא טופל']:
          this.reports_pre.push(report);
          break;
        case eStatus.בטיפול:
          this.reports_in.push(report);
          break;
        case eStatus.טופל:
          this.reports_post.push(report);
          break;
      }
    });
    this.reports_pre = this.sortByDate(this.reports_pre);
    this.reports_in = this.sortByDate(this.reports_in);
    this.reports_post = this.sortByDate(this.reports_post);
  }

  findReportById(id: number): number {
    let i: number = 0;
    for (; i < this.reports.length && this.reports[i].id != id; i++);
    return i;
  }

  updateStatus(report: ReportView, status: number): void {
    try {
      this.reportService.updateReportStatus(report.id, status).subscribe(() => {
        let placing = this.findReportById(report.id);
        if (placing > 0 && placing <= this.reports.length) {
          this.reports[placing].status = status;
          this.sortToLists();
        }
        if (report == this.selectedReport) {
          this.selectedReport.status = status;
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
