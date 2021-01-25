import { Component, OnInit } from '@angular/core';

export enum eCategory { Song, Article, Playlist, Parade, Singer, Artist, Tag }

@Component({
  selector: 'crud-actions',
  templateUrl: './crud-actions.component.html',
  styleUrls: ['./crud-actions.component.css']
})
export class CrudActionsComponent implements OnInit {

  categories = [{
    value: "שיר",
    category: eCategory.Song
  }, {
    value: "כתבה",
    categoty: eCategory.Article
  }, {
    value: "פלייליסט",
    category: eCategory.Playlist
  }, {
    value: "מצעד",
    category: eCategory.Parade
  }, {
    value: "זמר",
    category: eCategory.Singer
  }, {
    value: "אומן",
    category: eCategory.Artist
  }, {
    value: "תגית",
    category: eCategory.Tag
  }];
  selected = {
    value: "שיר",
    category: eCategory.Song
  }

  constructor() { }

  ngOnInit(): void {
  }

  getRouter(category: eCategory): string {
    return eCategory[category];
  }

}
