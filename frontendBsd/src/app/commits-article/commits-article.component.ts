import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommitsToArticles } from '../classes/commitsToArticles';
import { CommitsToArticlesService } from '../services/commits-to-articles.service';

@Component({
  selector: 'Commits-article',
  templateUrl: './Commits-article.component.html',
  styleUrls: ['./Commits-article.component.css']
})
export class CommitsArticleComponent implements OnInit {

  commits: CommitsToArticles[] = [];

  constructor(private CommitToArticlesService: CommitsToArticlesService, private activatedRoute: ActivatedRoute,
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
    this.CommitToArticlesService.getArticleCommits(parseInt(this.activatedRoute.snapshot.queryParams.articleId))
      .subscribe(commit => { this.commits = commit; this.orderCommits(); 
        this.cdr.detectChanges(); }, err => { console.log(err); });
  }

  orderCommits(): void {
    this.commits.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

  updateData(e: CommitsToArticles): void {
    e.date = new Date();
    this.commits.push(e);
    this.orderCommits();
  }

}
