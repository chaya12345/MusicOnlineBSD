import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatAccordion } from '@angular/material';
import { Router } from '@angular/router';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'adding-response',
  templateUrl: './adding-response.component.html',
  styleUrls: ['./adding-response.component.css']
})
export class AddingResponseComponent implements OnInit {

  @ViewChild(MatAccordion, null) accordion: MatAccordion;
  isWantToAdd: boolean = false;
  formRespons: FormGroup;
  newResponse: ResponsesToArticles = new ResponsesToArticles;

  constructor(private responsesToArticlesService: ResponsesToArticlesService, private router: Router) { 
    this.formRespons = new FormGroup({
      fullName: new FormControl("", [Validators.required, Validators.minLength(2)]),
      // email:new FormControl(""),
      title: new FormControl("", Validators.required),
      message: new FormControl("", Validators.maxLength(100))
    });
  }

  ngOnInit() {
  }
  
  onSubmit() {
    if (this.formRespons.valid) {
      var str = this.router.url;
      var res = str.split("/");
      this.newResponse.articleId = Number(res[res.length - 1]);
      this.newResponse.name = this.formRespons.controls.fullName.value;
      this.newResponse.title = this.formRespons.controls.title.value;
      this.newResponse.content = this.formRespons.controls.message.value;
      //השדה מייל מיותר כי אין מייל בתגובות
      //וגם לא צריך לדעת מה המייל בכלל
      this.responsesToArticlesService.addResponse(this.newResponse).subscribe();
      this.reset();
      this.newResponse = null;
    }
    
  }
  reset() {
    this.formRespons.reset({ value: "" });
  }

  toggleResponse(): void {
    this.isWantToAdd = !this.isWantToAdd;
  }

}
