import { Component, OnInit } from '@angular/core';

export enum eAction { add = 1, edit, delete }

@Component({
  selector: 'manage-song',
  templateUrl: './manage-song.component.html',
  styleUrls: ['./manage-song.component.css']
})
export class ManageSongComponent implements OnInit {

  activeAction: eAction = eAction.add;

  constructor() { }

  ngOnInit(): void {
  }

}
