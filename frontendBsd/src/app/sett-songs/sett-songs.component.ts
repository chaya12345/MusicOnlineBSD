import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'sett-songs',
  templateUrl: './sett-songs.component.html',
  styleUrls: ['./sett-songs.component.css']
})
export class SettSongsComponent implements OnInit {

  srcResult: any;
  fileName: string = "";
  imageSrc: string | ArrayBuffer;
  typeFile: string;

  constructor() { }

  ngOnInit(): void {
  }

  openInput() {
    document.getElementById("fileInput").click();
  }

  onFileInput(event) {
    if (event.target.files[0] && String(event.target.files[0].type).includes("image")) {
      this.fileName = event.target.files[0].name;
      // const inputNode: any = document.querySelector('#file');

      if (typeof (FileReader) !== 'undefined') {
        const reader = new FileReader();

        reader.onload = (e: any) => {
          this.srcResult = e.target.result; this.imageSrc = reader.result;
        };

        // reader.readAsArrayBuffer(inputNode.files[0]);
        reader.readAsDataURL(event.target.files[0]);
      }
    }
  }

  @ViewChild('figAudio') figAudio: ElementRef; // audio tag reference
  audSrc = 'path/to/default/sound.mpeg';

  audFileSelected(event: any) {
    if (event.target.files && event.target.files[0]) {
      let type = String(event.target.files[0].type);
      if (type.includes("video") || type.includes("audio")) {
        if (type.includes("video")) {
          this.typeFile = "video";
        }
        else if (type.includes("audio")) {
          this.typeFile = "audio";
        }
        this.audSrc = URL.createObjectURL(event.target.files[0]);
        this.figAudio.nativeElement.src = this.audSrc;
      }
    }
    else {
      this.typeFile = "";
    }
  }

}
