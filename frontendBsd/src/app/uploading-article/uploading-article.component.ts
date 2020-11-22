import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'uploading-article',
  templateUrl: './uploading-article.component.html',
  styleUrls: ['./uploading-article.component.css']
})
export class UploadingArticleComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
  }

}
