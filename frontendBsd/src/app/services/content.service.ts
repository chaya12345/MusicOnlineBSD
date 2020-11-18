import { HttpClient } from '@angular/common/http';
import { Content } from '@angular/compiler/src/render3/r3_ast';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Article } from '../classes/article';

@Injectable({
  providedIn: 'root'
})
export class ContentService {

  url: any;

  baseUrl: string ="https://localhost:44368/api/TextEditor/";

  constructor(private http: HttpClient) { }
  
  AddUpdateContent(pagecontent: Article): Observable<any> {
    debugger
    this.url = this.baseUrl + 'saveconetnt';
    return this.http.post<any>(this.url, pagecontent);
  }
  Getcontent() {
    debugger
    this.url = this.baseUrl + 'Getpagdata';
    return this.http.get(this.url);
  }
  GetcontentById(Id) {
    debugger
    this.url = this.baseUrl + 'GetpagecontentBy?Id=' + Id;
    return this.http.get(this.url);
  }

}
