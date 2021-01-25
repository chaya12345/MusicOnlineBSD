import { Component, OnInit } from '@angular/core';

export class Category {
  value: string;
  type: eCategory;
}

export enum eCategory { Song, Article, Playlist, Parade, Singer, Artist, Tag }

@Component({
  selector: 'crud-actions',
  templateUrl: './crud-actions.component.html',
  styleUrls: ['./crud-actions.component.css']
})
export class CrudActionsComponent implements OnInit {

  categories: Category[] = [{
    value: "שיר",
    type: eCategory.Song
  }, {
    value: "כתבה",
    type: eCategory.Article
  }, {
    value: "פלייליסט",
    type: eCategory.Playlist
  }, {
    value: "מצעד",
    type: eCategory.Parade
  }, {
    value: "זמר",
    type: eCategory.Singer
  }, {
    value: "אומן",
    type: eCategory.Artist
  }, {
    value: "תגית",
    type: eCategory.Tag
  }];
  selected = {
    value: "שיר",
    category: eCategory.Song
  }

  constructor() { }

  ngOnInit(): void {
  }

  getRouter(type: eCategory): string {
    return eCategory[type];
  }

}
