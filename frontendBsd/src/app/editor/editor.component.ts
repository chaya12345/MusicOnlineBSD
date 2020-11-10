import { Component, OnInit } from '@angular/core';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import EasyImage from '@ckeditor/ckeditor5-easy-image/src/easyimage';
// import Essentials from '@ckeditor/ckeditor5-essentials/src/essentials';
// import Paragraph from '@ckeditor/ckeditor5-paragraph/src/paragraph';
// import Bold from '@ckeditor/ckeditor5-basic-styles/src/bold';
// import Italic from '@ckeditor/ckeditor5-basic-styles/src/italic';
// import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

@Component({
  selector: 'editor',
  templateUrl: './editor.component.html',
  styleUrls: ['./editor.component.css']
})
export class EditorComponent implements OnInit {


  // private ckeditorContent: string;
  // public Editor = ClassicEditor;
  // ckEditorConfig: { filebrowserUploadUrl: string; fileTools_requestHeaders: { 'X-Requested-With': string; Authorization: string; }; filebrowserUploadMethod: string; on: { instanceReady: (evt: any) => void; fileUploadRequest: (evt: any) => void; }; };
  // ckeConfig: { height: number; language: string; allowedContent: boolean; toolbar: { name: string; items: string[]; }[]; };

  constructor() { }

  ngOnInit(): void {
    //   this.ckEditorConfig = {
    //     filebrowserUploadUrl: 'http://192.168.0.107:8000/api/crm/v1.0/crm-distribution-library-files',
    //     fileTools_requestHeaders: {
    //       'X-Requested-With': 'xhr',
    //       Authorization: 'Bearer ' + localStorage.getItem('access_token')
    //     },
    //     filebrowserUploadMethod: 'xhr',
    //     on: {
    //       instanceReady: function (evt) {
    //         var editor = evt.editor;
    //         console.log('editor ===>', editor);
    //       },
    //       fileUploadRequest: function (evt) {
    //         console.log('evt ===>', evt);
    //       },
    //     },
    //   };
    ClassicEditor
      .create(document.querySelector('#editor')/*, {
        plugins: [EasyImage]//,
        // toolbar: ['imageUpload', ... ],

        // Configure the endpoint. See the "Configuration" section above.
        // cloudServices: {
        //   tokenUrl: 'https://example.com/cs-token-endpoint',
        //   uploadUrl: 'https://your-organization-id.cke-cs.com/easyimage/upload/'
        // }
      }*/)
      .then(editor => {
        // window.editor = editor;
      })
      .catch(error => {
        console.error('There was a problem initializing the editor.', error);
      });
    // ClassicEditor
    //   .create(document.querySelector('#editor'), {
    //     plugins: [EasyImage, Essentials, Paragraph, Bold, Italic],
    //     toolbar: ['bold', 'italic']
    //   })
    //   .then(editor => {
    //     console.log('Editor was initialized', editor);
    //   })
    //   .catch(error => {
    //     console.error(error.stack);
    //   });
  }

}
