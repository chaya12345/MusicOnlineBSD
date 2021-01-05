import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Report, ReportView } from '../classes/report';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ReportsService {

  baseUrl: string = "https://localhost:44368/api/Reports/";
  constructor(private httpClient: HttpClient) { }
  public addReport(report: Report): Observable<any> {
    return this.httpClient.post(this.baseUrl + "PostReport", report);
  }
  public getReports(): Observable<Report[]> {
    return this.httpClient.get<Report[]>(this.baseUrl + "GetReports");
  }
  public getReportById(reportId: number): Observable<Report> {
    return this.httpClient.get<Report>(this.baseUrl + "GetReportById?reportId=" + reportId);
  }
  public updateReportStatus(reportId: number, status: number): Observable<boolean> {
    return this.httpClient.put<boolean>(this.baseUrl + "PutReportStatus?reportId=" + reportId + "&status=" + status, reportId);
  }
  public GetAllUntreatedReports(): Observable<Report[]> {
    return this.httpClient.get<Report[]>(this.baseUrl + "GetAllUntreatedReports");
  }
  public updateReportStatusToInProsses(reportId: number): Observable<any> {
    return this.httpClient.put(this.baseUrl + "PutReportStatus?reportId=" + reportId, reportId);
  }
  getReportsView():Observable<ReportView[]>{
    return this.httpClient.get<ReportView[]>(this.baseUrl+"GetReportsView");
  }
}
