import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'editing-newsletter',
  templateUrl: './editing-newsletter.component.html',
  styleUrls: ['./editing-newsletter.component.css']
})
export class EditingNewsletterComponent implements OnInit {

  text: string = "";

  constructor() { }

  ngOnInit(): void {
  }

  getContent(event: any): void {
    this.text = event;
  }

  onSubmit(): void {
    console.log(this.text);
  }

}
