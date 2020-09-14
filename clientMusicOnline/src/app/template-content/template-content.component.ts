import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'template-content',
  templateUrl: './template-content.component.html',
  styleUrls: ['./template-content.component.css']
})
export class TemplateContentComponent implements OnInit {

  href: string;

  constructor(private router: Router) { }

  ngOnInit(): void {
    this.href = this.router.url;
  }

}
