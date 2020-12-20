import { Component, OnInit } from '@angular/core';
import { Report } from '../classes/report';
import { ReportsService } from '../services/reports.service';

@Component({
  selector: 'reports-board',
  templateUrl: './reports-board.component.html',
  styleUrls: ['./reports-board.component.css']
})
export class ReportsBoardComponent implements OnInit {

  reports: Report[] = [];

  constructor(private reportService: ReportsService) {
    this.getReports();
   }

  ngOnInit(): void {
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

}
