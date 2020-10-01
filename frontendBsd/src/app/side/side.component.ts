import { Component, Input, OnInit } from '@angular/core';
import { Article } from '../classes/article';
import { Song } from '../classes/song';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'side',
  templateUrl: './side.component.html',
  styleUrls: ['./side.component.css']
})
export class SideComponent implements OnInit {

  @Input() similarSongs?: Song[] = [];
  @Input() similarArticles?: Article[] = [];
  latestArticles: Article[] = [];

  constructor(private articleService: ArticleService) { 
    try {
    this.articleService.getArticles().subscribe(article => { this.latestArticles = article; this.filter(); }, err => { console.log(err); });
    }
    catch { console.log('small-song'); }
  }

  ngOnInit() {
  }

  filter(): void {
    this.latestArticles.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.latestArticles = this.latestArticles.slice(0, 3);
  }

}
