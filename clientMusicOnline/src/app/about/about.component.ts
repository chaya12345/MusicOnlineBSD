import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

  aboutContent;

  constructor(http: HttpClient) {
    try {
      http.get('../../assets/text/about-site.txt', {
        responseType: 'text', headers: {
          "Accept": "application/txt;charset=utf-8",
          "Accept-Charset": "charset=utf-8"
        }
      }).subscribe(data => { this.aboutContent = data; });
    }
    catch { console.log('about'); }
  }

  ngOnInit() {
  }

}
