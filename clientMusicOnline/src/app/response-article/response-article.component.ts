import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatAccordion } from '@angular/material';
import { ResponsesToArticles } from '../classes/responsesToArticles';

@Component({
  selector: 'response-article',
  templateUrl: './response-article.component.html',
  styleUrls: ['./response-article.component.css']
})
export class ResponseArticleComponent implements OnInit {

  @Input() responses: ResponsesToArticles[] = [];
  // isWantToAdd: boolean = false;
  @ViewChild(MatAccordion) accordion: MatAccordion;

  constructor() { }

  ngOnInit(): void {
  }

}
