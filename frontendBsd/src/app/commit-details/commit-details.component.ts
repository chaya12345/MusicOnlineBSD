import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MatSnackBar, MAT_DIALOG_DATA } from '@angular/material';
import { single } from 'rxjs/operators';
import { Commit } from '../classes/commit';
import { ArticleService } from '../services/article.service';
import { CommitsToArticlesService } from '../services/commits-to-articles.service';
import { CommitsToSongsService } from '../services/commits-to-songs.service';
import { CommonMessageService } from '../services/common-message.service';
import { SongService } from '../services/song.service';

export interface commitDetailsInterface {
  commit: Commit;
}
@Component({
  selector: 'commit-details',
  templateUrl: './commit-details.component.html',
  styleUrls: ['./commit-details.component.css']
})
export class CommitDetailsComponent implements OnInit {

  commit: Commit;
  topicName: string;
  isTested:boolean;
  constructor(public dialogRef: MatDialogRef<CommitDetailsComponent>, private articleService: ArticleService,
    private songServices: SongService, @Inject(MAT_DIALOG_DATA) public data: commitDetailsInterface,
    private commitsToArticlesService: CommitsToArticlesService,private commitsToSongsService: CommitsToSongsService,
    private cmService: CommonMessageService,private _snackBar: MatSnackBar,) {
    this.commit = data.commit;
    this.isTested=this.commit.tested;
    try {
      if (this.commit.type == "article") {
        this.articleService.getArticleById(this.commit.topicId).subscribe(article =>
          this.topicName = article.title, err => console.log(err));
      }
      else if (this.commit.type == "song") {
        this.songServices.getSongById(this.commit.topicId).subscribe(song =>
          this.topicName = song.name, err => console.log(err));
      }
    } catch (err) { console.log(err) }
  }

  ngOnInit(): void {
  }

  onNoClick(status?: boolean): void {
    // if (status == true || status == false)
    //   this.dialogRef.close(status);
    // else
      this.dialogRef.close(this.isTested);
  }
  changeSigning(commit: Commit, isSign: boolean,close:boolean=true): void {
    if (commit.type == "article") {
      try {
        this.commitsToArticlesService.updateIsTested(commit.id, isSign).subscribe(result => {
          if (result == true) {
            this.commit.tested=isSign;
            this.isTested=isSign;
            this.openSnackBar(this.cmService.COMMIT_SIGNING.SUCCESS);
            close?this.onNoClick(isSign):this.isTested=isSign;
          }
          else this.openSnackBar(this.cmService.COMMIT_SIGNING.FAIL);
        }, err => this.openSnackBar(this.cmService.COMMIT_SIGNING.ERROR));
      } catch (err) { console.log(err); }
    }
    else if (commit.type == "song") {
      try {
        this.commitsToSongsService.updateIsTested(commit.id, isSign).subscribe(result => {
          if (result == true) {
            this.openSnackBar(this.cmService.COMMIT_SIGNING.SUCCESS);
            this.commit.tested=isSign;
            this.isTested=isSign;
            close?this.onNoClick(isSign):this.isTested=isSign;
          }
          else this.openSnackBar(this.cmService.COMMIT_SIGNING.FAIL);
        }, err => this.openSnackBar(this.cmService.COMMIT_SIGNING.ERROR));
      } catch (err) { console.log(err); }
    }
  }
  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }
}
