import { Component, Input, OnInit } from '@angular/core';
import { ResponsesToArticles } from '../classes/responsesToArticles';

@Component({
  selector: 'responses-article',
  templateUrl: './responses-article.component.html',
  styleUrls: ['./responses-article.component.css']
})
export class ResponsesArticleComponent implements OnInit {

  @Input() responses: ResponsesToArticles[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
