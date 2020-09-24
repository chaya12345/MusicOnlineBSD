import { Component, EventEmitter, OnInit, Output, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatAccordion } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { FollowUp } from '../classes/followUp';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { FollowUpService } from '../services/follow-up.service';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'adding-response',
  templateUrl: './adding-response.component.html',
  styleUrls: ['./adding-response.component.css']
})
export class AddingResponseComponent implements OnInit {

  @Output() onSend: EventEmitter<ResponsesToSongs> = new EventEmitter<ResponsesToSongs>()
  @ViewChild(MatAccordion, null) accordion: MatAccordion;
  isWantToAdd: boolean = false;
  formRespons: FormGroup;
  newResponsesToArticles: ResponsesToArticles;
  newResponsesToSongs: ResponsesToSongs;
  newFollowUp: FollowUp = new FollowUp;

  constructor(private responsesToArticlesService: ResponsesToArticlesService, private activatedRoute: ActivatedRoute,
    private responseToSongsService: ResponseToSongsService, private followUpService: FollowUpService) {
    this.formRespons = new FormGroup({
      fullName: new FormControl("", [Validators.required, Validators.minLength(2)]),
      email: new FormControl("", Validators.email),
      title: new FormControl("", Validators.required),
      message: new FormControl("", Validators.maxLength(500))
    });
  }

  ngOnInit() {
  }

  onSubmit() {
    if (this.formRespons.valid) {
      if (this.activatedRoute.snapshot.routeConfig.path.includes('song') == true) {
        this.newResponsesToSongs = new ResponsesToSongs();
        this.newResponsesToSongs.songId = Number(this.activatedRoute.snapshot.paramMap.get('id'));
        this.newResponsesToSongs.name = this.formRespons.controls.fullName.value;
        this.newResponsesToSongs.title = this.formRespons.controls.title.value;
        this.newResponsesToSongs.content = this.formRespons.controls.message.value;
        this.responseToSongsService.addResponse(this.newResponsesToSongs).subscribe();
        if (this.formRespons.controls.email.value != null) {
          this.newFollowUp.mail = this.formRespons.controls.email.value;
          this.newFollowUp.songId = this.newResponsesToSongs.songId;
          this.followUpService.addFollowUp(this.newFollowUp).subscribe();
          this.newFollowUp=null;
        }
        this.onSend.emit(this.newResponsesToSongs);
        this.newResponsesToSongs = null;
        this.reset();
      }
      else if (this.activatedRoute.snapshot.routeConfig.path.includes('article') == true) {
        this.newResponsesToArticles = new ResponsesToArticles;
        this.newResponsesToArticles.articleId = Number(this.activatedRoute.snapshot.paramMap.get('id'));
        this.newResponsesToArticles.name = this.formRespons.controls.fullName.value;
        this.newResponsesToArticles.title = this.formRespons.controls.title.value;
        this.newResponsesToArticles.content = this.formRespons.controls.message.value;
        this.responsesToArticlesService.addResponse(this.newResponsesToArticles).subscribe();
        if (this.formRespons.controls.email.value != null) {
          this.newFollowUp.mail = this.formRespons.controls.email.value;
          this.newFollowUp.articleId = this.newResponsesToArticles.articleId;
          this.followUpService.addFollowUp(this.newFollowUp).subscribe();
          this.newFollowUp=null;
        }
        this.newResponsesToArticles = null;
        this.reset();
      }
    }
  }
  reset() {
    this.formRespons.reset({ value: "" });
  }

  toggleResponse(): void {
    this.isWantToAdd = !this.isWantToAdd;
  }

}
