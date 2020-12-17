import { Component, ElementRef, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';

@Component({
  selector: 'uploading-audio-video-file',
  templateUrl: './uploading-audio-video-file.component.html',
  styleUrls: ['./uploading-audio-video-file.component.css']
})
export class UploadingAudioVideoFileComponent implements OnInit {

  @Input() song?: string;
  @Output() onSelect: EventEmitter<File> = new EventEmitter<File>();
  srcResult: any;
  fileName: string = "";
  imageSrc: string | ArrayBuffer;

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.song != null) {
      this.audSrc = this.song;
      this.typeFile =
       this.song.slice(this.song.lastIndexOf(".") + 1, this.song.length) == ("mp3" || "wav" || "mpeg") ?
       "audio" : "video";
    }
  }

  openInput() {
    document.getElementById("fileInput1").click();
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
      this.onSelect.emit(fileToUpload);
    }
  }

  @ViewChild('figAudio1') figAudio1: ElementRef; // audio tag reference
  audSrc = 'path/to/default/sound.mpeg';
  typeFile: string;

  audFileSelected(event: any) {
    if (event.target.files && event.target.files[0]) {
      let type = String(event.target.files[0].type);
      if (type.includes("video") || type.includes("audio")) {
        this.onSelect.emit(event.target.files[0]);
        if (type.includes("video")) {
          this.typeFile = "video";
        }
        else if (type.includes("audio")) {
          this.typeFile = "audio";
        }
        this.figAudio1 = new ElementRef(URL.createObjectURL(event.target.files[0]));
        this.audSrc = URL.createObjectURL(event.target.files[0]);
        this.figAudio1.nativeElement.src = this.audSrc;
      }
    }
    else {
      this.typeFile = "";
    }
  }

}
