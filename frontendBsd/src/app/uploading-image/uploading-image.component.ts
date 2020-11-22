import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'uploading-image',
  templateUrl: './uploading-image.component.html',
  styleUrls: ['./uploading-image.component.css']
})
export class UploadingImageComponent implements OnInit {
  
  // @Output() onSelect: EventEmitter<FormData> = new EventEmitter<FormData>();
  @Output() onSelect: EventEmitter<File> = new EventEmitter<File>();
  srcResult: any;
  fileName: string = "";
  imageSrc: string | ArrayBuffer;

  constructor() { }

  ngOnInit(): void {
  }

  openInput() {
    document.getElementById("fileInput").click();
  }

  onFileInput(event) {
    if (event.target.files[0] && String(event.target.files[0].type).includes("image")) {
      this.fileName = event.target.files[0].name;
      if (typeof (FileReader) !== 'undefined') {
        const reader = new FileReader();
        reader.onload = (e: any) => {
          this.srcResult = e.target.result; this.imageSrc = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
      }
      let fileToUpload = <File>event.target.files[0];
      const formData = new FormData();
      formData.append('file', fileToUpload, fileToUpload.name);
      console.log(formData);
      console.log(fileToUpload);
      // this.onSelect.emit(formData);
      this.onSelect.emit(fileToUpload);
    }
  }

}
