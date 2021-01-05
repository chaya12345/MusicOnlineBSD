import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { single } from 'rxjs/operators';
import { Commit } from '../classes/commit';
import { ArticleService } from '../services/article.service';
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
  constructor(public dialogRef: MatDialogRef<CommitDetailsComponent>, private articleService: ArticleService,
    private songServices: SongService, @Inject(MAT_DIALOG_DATA) public data: commitDetailsInterface) {
    this.commit = data.commit;
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
    if (status == true || status == false)
      this.dialogRef.close(status);
    else
      this.dialogRef.close();
  }

}
