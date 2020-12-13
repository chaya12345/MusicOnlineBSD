import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommitsToSongs } from '../classes/commitsToSongs';
import { CommitsToSongsService } from '../services/commits-to-songs.service';

@Component({
  selector: 'commits-song',
  templateUrl: './commits-song.component.html',
  styleUrls: ['./commits-song.component.css']
})
export class CommitsSongComponent implements OnInit {

  commits: CommitsToSongs[] = [];
  commitId: number;
  constructor(private commitToSongsService: CommitsToSongsService, private activatedRoute: ActivatedRoute,
    private cdr: ChangeDetectorRef) { }

  ngOnInit() {

    try {
      this.getCommits();
    } catch { }
  }

  ngOnChanges(): void {
    try {
      this.getCommits();
    } catch { }
  }

  getCommits(): void {
    this.commitToSongsService.getSongCommits(parseInt(this.activatedRoute.snapshot.queryParams.songId))
      .subscribe(commit => {
        this.commits = commit; this.orderCommits();
        this.cdr.detectChanges();
      }, err => { console.log(err); });
  }

  orderCommits(): void {
    this.commits.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

  updateData(e: CommitsToSongs): void {
    e.date = new Date();
    this.commits.push(e);
    this.orderCommits();
  }

}
