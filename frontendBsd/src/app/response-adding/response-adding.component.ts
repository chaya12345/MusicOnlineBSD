import { ChangeDetectorRef, Component, EventEmitter, OnInit, Output, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatAccordion } from '@angular/material';
import { ActivatedRoute } from '@angular/router';
import { FollowUp } from '../classes/followUp';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { FollowUpService } from '../services/follow-up.service';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'response-adding',
  templateUrl: './response-adding.component.html',
  styleUrls: ['./response-adding.component.css']
})
export class ResponseAddingComponent implements OnInit {

  @Output() onSendToSong: EventEmitter<ResponsesToSongs> = new EventEmitter<ResponsesToSongs>();
  @Output() onSendToArticle: EventEmitter<ResponsesToArticles> = new EventEmitter<ResponsesToArticles>();
  @ViewChild(MatAccordion, { static: true }) accordion: MatAccordion;
  isWantToAdd: boolean = false;
  responseForm: FormGroup;
  newResponseToSong: ResponsesToSongs;
  newResponseToArticle: ResponsesToArticles;
  newFollowUp: FollowUp;

  constructor(private resToSongsService: ResponseToSongsService, private activatedRoute: ActivatedRoute,
    private followUpService: FollowUpService, private resToArticlesService: ResponsesToArticlesService,
    private cdr: ChangeDetectorRef) { 
    this.responseForm = new FormGroup({
      fullName: new FormControl("", [Validators.required, Validators.minLength(2)]),
      email: new FormControl("", Validators.email),
      title: new FormControl("", Validators.required),
      messange: new FormControl("", Validators.maxLength(500))
    });
  }

  ngOnInit() {
  }

  onSubmit() {
    if (this.responseForm.valid) {
      if (this.activatedRoute.snapshot.routeConfig.path.includes("song") == true) {
        this.newResponseToSong = new ResponsesToSongs();
        this.newResponseToSong.songId = this.activatedRoute.snapshot.queryParams.songId;
        this.newResponseToSong.name = this.responseForm.controls.fullName.value;
        this.newResponseToSong.title = this.responseForm.controls.title.value;
        this.newResponseToSong.content = this.responseForm.controls.messange.value;
        this.resToSongsService.addResponse(this.newResponseToSong).subscribe(() => this.cdr.detectChanges());
        if (this.responseForm.controls.email.value != null && this.responseForm.controls.email.value != "") {
          this.newFollowUp = new FollowUp();
          this.newFollowUp.mail = this.responseForm.controls.email.value;
          this.newFollowUp.songId = this.newResponseToSong.songId;
          this.followUpService.addFollowUp(this.newFollowUp).subscribe();
          this.newFollowUp = null;
        }
        this.onSendToSong.emit(this.newResponseToSong);
        this.newResponseToSong = null;
        this.reset();
      }
      else if (this.activatedRoute.snapshot.routeConfig.path.includes("article") == true) {
        this.newResponseToArticle = new ResponsesToArticles();
        this.newResponseToArticle.articleId = Number(this.activatedRoute.snapshot.queryParams.articleId);
        this.newResponseToArticle.name = this.responseForm.controls.fullName.value;
        this.newResponseToArticle.title = this.responseForm.controls.title.value;
        this.newResponseToArticle.content = this.responseForm.controls.messange.value;
        this.resToArticlesService.addResponse(this.newResponseToArticle).subscribe(() => this.cdr.detectChanges());
        if (this.responseForm.controls.email.value != null && this.responseForm.controls.email.value != "") {
          this.newFollowUp = new FollowUp();
          this.newFollowUp.mail = this.responseForm.controls.email.value;
          this.newFollowUp.articleId = this.newResponseToArticle.articleId;
          this.followUpService.addFollowUp(this.newFollowUp).subscribe();
          this.newFollowUp = null;
        }
        this.onSendToArticle.emit(this.newResponseToArticle);
        this.newResponseToArticle = null;
        this.reset();
      }
    }
  }

  reset() {
    this.responseForm.reset({ value: "" });
  }

  cancel(): void {
    this.reset();
  }

  getNameErrorMessage() {
    if (this.responseForm.controls.fullName.hasError("required")) {
      return "זהו שדה חובה.";
    }
    else if (this.responseForm.controls.fullName.hasError("minlength")) {
      return "שם לא תקין. (פחות מ-2 תווים)"
    }
  }

  getMailErrorMessage() {
    if (this.responseForm.controls.email.hasError("email")) {
      return "כתובת מייל לא חוקית.";
    }
  }

  getTitleErrorMessage() {
    if (this.responseForm.controls.title.hasError("required")) {
      return "זהו שדה חובה.";
    }
  }
}
