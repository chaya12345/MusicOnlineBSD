import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'uploading-song',
  templateUrl: './uploading-song.component.html',
  styleUrls: ['./uploading-song.component.css']
})
export class UploadingSongComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  selectImage(fileToUpload: File): void {
    console.log(fileToUpload.name);
  }

}
