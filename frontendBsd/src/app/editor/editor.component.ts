import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import EasyImage from '@ckeditor/ckeditor5-easy-image/src/easyimage';
import { Article } from '../classes/article';
import { Content } from '../classes/content';
import { ContentService } from '../services/content.service';

import SimpleUploadAdapter from '@ckeditor/ckeditor5-upload/src/adapters/simpleuploadadapter';
import { environment } from 'src/environments/environment';
import { UploadAdapter } from '../classes/UploadAdapter';
import Alignment from '@ckeditor/ckeditor5-alignment/src/alignment';

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

  name = 'ng2-ckeditor';
  ckeConfig: any;
  mycontent: string;
  log: string
  @ViewChild('PageContent') PageContent: any;
  res: any;

  // private ckeditorContent: string;
  public Editor = ClassicEditor;
  ckEditorConfig: { filebrowserUploadUrl: string; fileTools_requestHeaders: { 'X-Requested-With': string; Authorization: string; }; filebrowserUploadMethod: string; on: { instanceReady: (evt: any) => void; fileUploadRequest: (evt: any) => void; }; };
  // ckeConfig: { height: number; language: string; allowedContent: boolean; toolbar: { name: string; items: string[]; }[]; };

  contentdata: Content = new Content();
  article: Article = new Article();

  constructor(private contentservice: ContentService, private router: Router) {
    this.contentdata.PageContentTitle = "";
    this.contentdata.PageContent = "";
  }

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
          console.log("Yes bsd!");
          console.log('evt ===>', evt);
          console.log("evt");
          console.log(evt);
        },
      },
      // simpleUpload: {
      //   // The URL that the images are uploaded to.
      //   uploadUrl: environment.postSaveRteImage,

      //   // Headers sent along with the XMLHttpRequest to the upload server.
      //   headers: {
      //     'X-CSRF-TOKEN': 'CSFR-Token',
      //     Authorization: 'Bearer <JSON Web Token>'
      //   }
      // }
    };
    /*----------------------*/
    ClassicEditor
      .create(document.querySelector('#editor'), {
        // plugins: [EasyImage]
         //plugins: [ SimpleUploadAdapter, Alignment ],
        // simpleUpload: {
        //     // Feature configuration.
        //     uploadUrl: 'http://4200/assets/text/for_articles',

        //     // Enable the XMLHttpRequest.withCredentials property.
        //     withCredentials: true,

        //     // Headers sent along with the XMLHttpRequest to the upload server.
        //     headers: {
        //         'X-CSRF-TOKEN': 'CSRF-Token',
        //         Authorization: 'Bearer <JSON Web Token>'
        //     }
        // }
        /*plugins: [EasyImage]//,
        // toolbar: ['imageUpload', ... ],

        // Configure the endpoint. See the "Configuration" section above.
        // cloudServices: {
        //   tokenUrl: 'https://example.com/cs-token-endpoint',
        //   uploadUrl: 'https://your-organization-id.cke-cs.com/easyimage/upload/'
        //}*/ }
      )
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
    this.Getcontent()
    this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true
    };
    ClassicEditor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
      console.log("Yes only bsd!");
      console.log(loader);
      return new UploadAdapter(loader);
    };
  }

  onSubmit() {
    debugger;
    this.contentservice.AddUpdateContent(this.article).subscribe((data: any) => {
      debugger;
      alert("Data saved Successfully");
      // this.router.navigate(['/Post']);
    });
  }
  Getcontent() {
    this.contentservice.Getcontent().subscribe((data: any) => {
      this.res = data;
      console.log(this.res);
    })
  }

}
