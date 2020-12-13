import { ChangeDetectorRef, Component, EventEmitter, OnInit, Output, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatAccordion } from '@angular/material';
import { ActivatedRoute } from '@angular/router';
import { CommitsToArticles } from '../classes/commitsToArticles';
import { CommitsToSongs } from '../classes/commitsToSongs';
import { FollowUp } from '../classes/followUp';
import { FollowUpService } from '../services/follow-up.service';
import { CommitsToSongsService } from '../services/commits-to-songs.service';
import { CommitsToArticlesService } from '../services/commits-to-articles.service';

@Component({
  selector: 'commit-adding',
  templateUrl: './commit-adding.component.html',
  styleUrls: ['./commit-adding.component.css']
})
export class CommitAddingComponent implements OnInit {

  @Output() onSendToSong: EventEmitter<CommitsToSongs> = new EventEmitter<CommitsToSongs>();
  @Output() onSendToArticle: EventEmitter<CommitsToArticles> = new EventEmitter<CommitsToArticles>();
  @ViewChild(MatAccordion, { static: true }) accordion: MatAccordion;
  isWantToAdd: boolean = false;
  commitForm: FormGroup;
  newCommitToSong: CommitsToSongs;
  newCommitToArticle: CommitsToArticles;
  newFollowUp: FollowUp;

  constructor(private resToSongsService: CommitsToSongsService, private activatedRoute: ActivatedRoute,
    private followUpService: FollowUpService, private resToArticlesService: CommitsToArticlesService,
    private cdr: ChangeDetectorRef) { 
    this.commitForm = new FormGroup({
      fullName: new FormControl("", [Validators.required, Validators.minLength(2)]),
      email: new FormControl("", Validators.email),
      title: new FormControl("", Validators.required),
      messange: new FormControl("", Validators.maxLength(500))
    });
  }

  ngOnInit() {
  }

  onSubmit() {
    if (this.commitForm.valid) {
      if (this.activatedRoute.snapshot.routeConfig.path.includes("song") == true) {
        this.newCommitToSong = new CommitsToSongs();
        this.newCommitToSong.songId = this.activatedRoute.snapshot.queryParams.songId;
        this.newCommitToSong.name = this.commitForm.controls.fullName.value;
        this.newCommitToSong.title = this.commitForm.controls.title.value;
        this.newCommitToSong.content = this.commitForm.controls.messange.value;
        this.resToSongsService.addCommit(this.newCommitToSong).subscribe(() => this.cdr.detectChanges());
        if (this.commitForm.controls.email.value != null && this.commitForm.controls.email.value != "") {
          this.newFollowUp = new FollowUp();
          this.newFollowUp.mail = this.commitForm.controls.email.value;
          this.newFollowUp.songId = this.newCommitToSong.songId;
          this.followUpService.addFollowUp(this.newFollowUp).subscribe();
          this.newFollowUp = null;
        }
        this.onSendToSong.emit(this.newCommitToSong);
        this.newCommitToSong = null;
        this.reset();
      }
      else if (this.activatedRoute.snapshot.routeConfig.path.includes("article") == true) {
        this.newCommitToArticle = new CommitsToArticles();
        this.newCommitToArticle.articleId = Number(this.activatedRoute.snapshot.queryParams.articleId);
        this.newCommitToArticle.name = this.commitForm.controls.fullName.value;
        this.newCommitToArticle.title = this.commitForm.controls.title.value;
        this.newCommitToArticle.content = this.commitForm.controls.messange.value;
        this.resToArticlesService.addCommit(this.newCommitToArticle).subscribe(() => this.cdr.detectChanges());
        if (this.commitForm.controls.email.value != null && this.commitForm.controls.email.value != "") {
          this.newFollowUp = new FollowUp();
          this.newFollowUp.mail = this.commitForm.controls.email.value;
          this.newFollowUp.articleId = this.newCommitToArticle.articleId;
          this.followUpService.addFollowUp(this.newFollowUp).subscribe();
          this.newFollowUp = null;
        }
        this.onSendToArticle.emit(this.newCommitToArticle);
        this.newCommitToArticle = null;
        this.reset();
      }
    }
  }

  reset() {
    this.commitForm.reset({ value: "" });
  }

  cancel(): void {
    this.reset();
  }

  getNameErrorMessage() {
    if (this.commitForm.controls.fullName.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.commitForm.controls.fullName.hasError("minlength")) {
      return "שם לא תקין. (פחות מ-2 תווים)"
    }
  }

  getMailErrorMessage() {
    if (this.commitForm.controls.email.hasError("email")) {
      return "כתובת מייל לא חוקית.";
    }
  }

  getTitleErrorMessage() {
    if (this.commitForm.controls.title.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }
}
