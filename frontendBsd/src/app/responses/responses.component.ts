import { ChangeDetectorRef } from '@angular/core';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { ResponseToSongsService } from '../services/response-to-songs.service';

@Component({
  selector: 'responses',
  templateUrl: './responses.component.html',
  styleUrls: ['./responses.component.css']
})
export class ResponsesComponent implements OnInit {
  
  // @Input() responsesSongList?: ResponsesToSongs[] = [];
  @Input() responsesArticleList?: ResponsesToArticles[] = [];
  responses: any;

  constructor(private responseToSongsService: ResponseToSongsService, public activatedRoute: ActivatedRoute,
    private cdr: ChangeDetectorRef) { }

  ngOnInit() {
  }

  ngOnChanges(): void {
    try {
    this.getResponses();
    // if(this.activatedRoute.snapshot.)
    } catch { }
  }

  getResponses(): void {
    this.responseToSongsService.getSongResponses(parseInt(this.activatedRoute.snapshot.paramMap.get('id')))
      .subscribe(response => { this.responses = response; this.orderResponses(); 
        this.cdr.detectChanges(); }, err => { console.log(err); });
  }

  orderResponses(): void {
    this.responses.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

}
