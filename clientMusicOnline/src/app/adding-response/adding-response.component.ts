import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatAccordion } from '@angular/material';
import { ResponsesToArticles } from '../classes/responsesToArticles';
import { ResponsesToArticlesService } from '../services/responses-to-articles.service';

@Component({
  selector: 'adding-response',
  templateUrl: './adding-response.component.html',
  styleUrls: ['./adding-response.component.css']
})
export class AddingResponseComponent implements OnInit {

  isWantToAdd: boolean = false;
  @ViewChild(MatAccordion) accordion: MatAccordion;
  formRespons:FormGroup;
  newResponse:ResponsesToArticles;

  constructor(private responsesToArticlesService:ResponsesToArticlesService) {
    this.formRespons=new FormGroup({
      fullName:new FormControl("",[Validators.required,Validators.minLength(2)]),
      email:new FormControl(""),
      title:new FormControl("",Validators.required),
      message:new FormControl("",Validators.maxLength(100))
    })
   }

  ngOnInit(): void {
  }
  onSubmit() {
    if(this.formRespons.valid){
     // this.newResponse.articleId= איך מביאים את המזהה של הכתבה?
      this.newResponse.name=this.formRespons.value.fullName;
      this.newResponse.title=this.formRespons.value.title;
      this.newResponse.content=this.formRespons.value.message;
//השדה מייל מיותר כי אין מייל בתגובות
//וגם לא צריך לדעת מה המייל בכלל
      this.responsesToArticlesService.addResponse(this.newResponse).subscribe();
      this.reset();
      this.newResponse=null;
    }
    
  }
  reset(){
    this.formRespons.reset({value:""});
  }

  toggleResponse(): void {
    this.isWantToAdd = !this.isWantToAdd;
  }

}
