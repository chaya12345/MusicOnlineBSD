import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatAccordion } from '@angular/material';
import { ResponsesToArticles } from '../classes/responsesToArticles';

@Component({
  selector: 'responses-article',
  templateUrl: './responses-article.component.html',
  styleUrls: ['./responses-article.component.css']
})
export class ResponsesArticleComponent implements OnInit {

  @Input() responses: ResponsesToArticles[] = [];
  // isWantToAdd: boolean = false;
  @ViewChild(MatAccordion, null) accordion: MatAccordion;

  constructor() { }

  ngOnInit() {
  }

}
