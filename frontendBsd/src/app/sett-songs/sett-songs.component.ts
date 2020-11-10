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

  constructor() { }

  ngOnInit(): void {
  }

  openInput() {
    document.getElementById("fileInput").click();
  }

  onFileInput(event) {
    this.fileName = event.target.files[0].name;
    const inputNode: any = document.querySelector('#file');

    if (typeof (FileReader) !== 'undefined') {
      const reader = new FileReader();

      reader.onload = (e: any) => {
        this.srcResult = e.target.result; this.imageSrc = reader.result;
      };

      // reader.readAsArrayBuffer(inputNode.files[0]);
      reader.readAsDataURL(event.target.files[0]);
    }
  }

  @ViewChild('figAudio') figAudio: ElementRef; // audio tag reference
  audSrc = 'path/to/default/sound.mpeg';

  audFileSelected(event: any) {
    if (event.target.files && event.target.files[0]) {
      this.audSrc = URL.createObjectURL(event.target.files[0]);
      this.figAudio.nativeElement.src = this.audSrc;
      console.log(this.audSrc);
    }
    console.log("arrive!");
  }

}
