import { Component, OnInit } from '@angular/core';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';

@Component({
  selector: 'editor',
  templateUrl: './editor.component.html',
  styleUrls: ['./editor.component.css']
})
export class EditorComponent implements OnInit {


  private ckeditorContent: string;
  public Editor = ClassicEditor;
  ckEditorConfig: { filebrowserUploadUrl: string; fileTools_requestHeaders: { 'X-Requested-With': string; Authorization: string; }; filebrowserUploadMethod: string; on: { instanceReady: (evt: any) => void; fileUploadRequest: (evt: any) => void; }; };

  constructor() { }

  ngOnInit(): void {  
    this.ckEditorConfig = {
      filebrowserUploadUrl: 'http://192.168.0.107:8000/api/crm/v1.0/crm-distribution-library-files',
      fileTools_requestHeaders: {
        'X-Requested-With': 'xhr',
        Authorization: 'Bearer ' + localStorage.getItem('access_token')
      },
      filebrowserUploadMethod: 'xhr',
      on: {
        instanceReady: function (evt) {
          var editor = evt.editor;
          console.log('editor ===>', editor);
        },
        fileUploadRequest: function (evt) {
          console.log('evt ===>', evt);
        },
      },
    };
  }

}
