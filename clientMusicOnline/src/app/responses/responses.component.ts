import { Component, OnInit, Input } from '@angular/core';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { ResponsesToSongs } from '../classes/responsesToSongs';

@Component({
  selector: 'responses',
  templateUrl: './responses.component.html',
  styleUrls: ['./responses.component.css']
})
export class ResponsesComponent implements OnInit {

  @Input() responsesSongList?: ResponsesToSongs[] = [];
  @Input() responsesArticleList?: ResponsesToArticles[] = [];
  @Input() type: string;

  constructor() { }

  ngOnInit(): void {
  }

}
