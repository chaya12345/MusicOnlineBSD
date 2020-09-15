import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Job } from '../classes/job';

@Injectable({
  providedIn: 'root'
})
export class JobService {

  baseUrl:string="https://localhost:44368/api/Jobs/";
  constructor(private httpClient:HttpClient) { }
  public getJobs():Observable<Job[]>{
    return this.httpClient.get<Job[]>(this.baseUrl+"GetJobs");
  }
  public addJob(job:Job):Observable<any>{
   return this.httpClient.post(this.baseUrl+"PostJob",job);
  }
}
