import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'text',
  templateUrl: './text.component.html',
  styleUrls: ['./text.component.css']
})
export class TextComponent implements OnInit {

  @Input() file: string = "";
  text: any;// string | ArrayBuffer = "";

  constructor(private httpClient: HttpClient) { }

  ngOnInit() {
    try {
      this.getText();
    } catch (err) { console.log(err); }
    console.log("text: " + this.file);
  }

  getText(): void {
    this.httpClient.get(this.file, {
      // commitType: 'text'
    }).subscribe(data => { this.text = data; });
  }

}
