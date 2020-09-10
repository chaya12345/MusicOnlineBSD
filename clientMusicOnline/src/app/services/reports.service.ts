import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Report } from '../classes/report';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ReportsService {

  constructor(private httpClient: HttpClient) { }
  public addReport(report: Report): void {
    this.httpClient.post("https://localhost:44368/api/Reports/PostReport", report);
  }
  public getReports(): Observable<Report[]> {
    return this.httpClient.get<Report[]>("https://localhost:44368/api/Reports/GetReports");
  }
  public getReportById(reportId:number):Observable<Report>{
    return this.httpClient.get<Report>("https://localhost:44368/api/Reports/GetReportById?reportId="+reportId);
  }
  public updateReportStatus(reportId:number,status:string):void{
   this.httpClient.put("https://localhost:44368/api/Reports/PutReportStatus?reportId="+reportId+"&status="+status,reportId);
  }
  public GetAllUntreatedReports():Observable<Report[]>{
    return this.httpClient.get<Report[]>("https://localhost:44368/api/Reports/GetAllUntreatedReports");
  }
}
