import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class UploadService {

  baseUrl: string = "https://localhost:44368/api/Upload/";

  constructor(private httpClient: HttpClient) { }
  
  postFile(fileToUpload: File): Observable<boolean> {
    const formData: FormData = new FormData();
    formData.append('fileKey', fileToUpload, fileToUpload.name);
    let headers = new Headers({ 'Content-Type': 'application/json' });    
    headers.append('Content-Type', 'multipart/form-data');

    // let options = new RequestOptions({ headers: headers, method: 'post' });
    return this.httpClient.post<boolean>(this.baseUrl + 'UploadImage', formData);
      // .map(
      //   (response => response.json()))
      // .catch(CommonFunctionService.handleError);
  }

}
