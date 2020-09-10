import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Job } from '../classes/job';

@Injectable({
  providedIn: 'root'
})
export class JobService {

  constructor(private httpClient:HttpClient) { }
  public getJobs():Observable<Job[]>{
    return this.httpClient.get<Job[]>("https://localhost:44368/api/Jobs/GetJobs");
  }
  public addJob(job:Job):void{
    this.httpClient.post("https://localhost:44368/api/Jobs/PostJob",job);
  }
}
