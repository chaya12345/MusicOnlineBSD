import { Component, OnInit } from '@angular/core';
import { eAction } from '../uploading-song/uploading-song.component';

@Component({
  selector: 'manage-article',
  templateUrl: './manage-article.component.html',
  styleUrls: ['./manage-article.component.css']
})
export class ManageArticleComponent implements OnInit {

  activeAction: eAction = eAction.add;

  constructor() { }

  ngOnInit(): void {
  }

}
