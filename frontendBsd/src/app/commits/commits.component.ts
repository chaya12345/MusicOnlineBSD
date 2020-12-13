import { ChangeDetectorRef } from '@angular/core';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommitsToArticles } from '../classes/commitsToArticles';
import { CommitsToSongsService } from '../services/commits-to-songs.service';

@Component({
  selector: 'commits',
  templateUrl: './commits.component.html',
  styleUrls: ['./commits.component.css']
})
export class CommitsComponent implements OnInit {
  
  // @Input() commitsSongList?: CommitsToSongs[] = [];
  @Input() commitsArticleList?: CommitsToArticles[] = [];
  commits: any;

  constructor(private commitToSongsService: CommitsToSongsService, public activatedRoute: ActivatedRoute,
    private cdr: ChangeDetectorRef) { }

  ngOnInit() {
  }

  ngOnChanges(): void {
    try {
    this.getCommits();
    // if(this.activatedRoute.snapshot.)
    } catch { }
  }

  getCommits(): void {
    this.commitToSongsService.getSongCommits(parseInt(this.activatedRoute.snapshot.paramMap.get('id')))
      .subscribe(commit => { this.commits = commit; this.orderCommits(); 
        this.cdr.detectChanges(); }, err => { console.log(err); });
  }

  orderCommits(): void {
    this.commits.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

}
