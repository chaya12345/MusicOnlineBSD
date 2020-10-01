import { ChangeDetectorRef, Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatAccordion } from '@angular/material';
import { ActivatedRoute } from '@angular/router';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'responses-article',
  templateUrl: './responses-article.component.html',
  styleUrls: ['./responses-article.component.css']
})
export class ResponsesArticleComponent implements OnInit {

  responses: ResponsesToArticles[] = [];

  constructor(private responseToArticlesService: ResponsesToArticlesService, private activatedRoute: ActivatedRoute,
    private cdr: ChangeDetectorRef) { }

  ngOnInit() {
    try {
    this.getResponses();
    } catch { }
  }

  ngOnChanges(): void {
    try {
    this.getResponses();
    } catch { }
  }

  getResponses(): void {
    this.responseToArticlesService.getArticleResponses(parseInt(this.activatedRoute.snapshot.paramMap.get('id')))
      .subscribe(response => { this.responses = response; this.orderResponses(); 
        this.cdr.detectChanges(); }, err => { console.log(err); });
  }

  orderResponses(): void {
    this.responses.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

  updateData(e: ResponsesToArticles): void {
    e.date = new Date();
    this.responses.push(e);
    this.orderResponses();
  }

}
