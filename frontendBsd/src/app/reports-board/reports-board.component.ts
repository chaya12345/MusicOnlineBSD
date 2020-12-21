import { Component, OnInit } from '@angular/core';
import { Report } from '../classes/report';
import { ReportsService } from '../services/reports.service';

export enum eStatus { "לא טופל" = 1, "בטיפול", "טופל" }

@Component({
  selector: 'reports-board',
  templateUrl: './reports-board.component.html',
  styleUrls: ['./reports-board.component.css']
})
export class ReportsBoardComponent implements OnInit {

  reports: Report[] = [];
  selectedReport: Report = null;

  constructor(private reportService: ReportsService) {
    this.getReports();
   }

  ngOnInit(): void {
  }

  prevent(event): void {
    event.stopPropagation();
  }

  getReports(): void {
    try {
      this.reportService.getReports()
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

  updateStatus(report: Report, status: number): void {
    try {
    this.reportService.updateReportStatus(report.id, status).subscribe(() => {
      this.getReports();
      if (report == this.selectedReport) {
        this.selectedReport.status = eStatus[status];
      }
    });
    } catch (err) { console.log(err); }
  }

}
