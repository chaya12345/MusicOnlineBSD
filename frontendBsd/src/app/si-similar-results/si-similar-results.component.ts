import { Component, Input, OnInit } from '@angular/core';
import { Article } from '../classes/article';
import { Song } from '../classes/song';

export class Item {
  id: number;
  img: string;
  title: string;
  date: Date;
}

@Component({
  selector: 'si-similar-results',
  templateUrl: './si-similar-results.component.html',
  styleUrls: ['./si-similar-results.component.css']
})
export class SiSimilarResultsComponent implements OnInit {

  @Input() songs?: Song[] = [];
  @Input() articles?: Article[] = [];
  items: Item[] = [];

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.songs.length > 0) {
      this.items = this.convertSongsToItems(this.songs);
    }
    else if (this.articles.length > 0) {
      this.items = this.convertArticlesToItems(this.articles);
    }
  }

  convertSongsToItems(songs: Song[]): Item[] {
    let items: Item[] = [];
    songs.forEach(song => {
      let item: Item = new Item();
      item.id = song.id;
      item.img = song.image_location;
      item.title = song.title;
      item.date = song.date;
      items.push(item);
    });
    return items;
  }

  convertArticlesToItems(articles: Article[]): Item[] {
    let items: Item[] = [];
    articles.forEach(article => {
      let item: Item = new Item();
      item.id = article.id;
      item.img = article.image;
      item.title = article.title;
      item.date = article.date;
      items.push(item);
    });
    return items;
  }

}
