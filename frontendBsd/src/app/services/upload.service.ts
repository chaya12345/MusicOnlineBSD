import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

export class MailDetails {
  username: string;
  email:string;
  password: string;
}

@Injectable({
  providedIn: 'root'
})
export class UploadService {

  baseUrl: string = "https://localhost:44368/api/Upload/";

  constructor(private httpClient: HttpClient) { }

  postFile(filesToUpload: File[], folderName: string, folderName2?: string, songName?: string, mailDetails?: MailDetails): Observable<boolean> {
    const formData: FormData = new FormData();
    // formData.append('fileKey', fileToUpload, fileToUpload.name);
    formData.append("fileToUpload1", filesToUpload[0], filesToUpload[0].name);
    if (folderName2 != null && folderName2 != undefined && folderName2 != "")
      formData.append("fileToUpload2", filesToUpload[1], filesToUpload[1].name);
    let headers = new Headers({ 'Content-Type': 'application/json' });
    headers.append('Content-Type', 'multipart/form-data');

    // let options = new RequestOptions({ headers: headers, method: 'post' });
    return this.httpClient.post<boolean>(this.baseUrl + "UploadImage?folderName=" + folderName + "&folderName2=" + folderName2 + 
    "&songName=" + songName + "&details=" + mailDetails, formData);
    // .map(
    //   (commit => commit.json()))
    // .catch(CommonFunctionService.handleError);
  }

}
