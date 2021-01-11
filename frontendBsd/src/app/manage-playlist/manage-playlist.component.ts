import { Component, OnInit } from '@angular/core';
import { eAction } from '../uploading-song/uploading-song.component';

@Component({
  selector: 'manage-playlist',
  templateUrl: './manage-playlist.component.html',
  styleUrls: ['./manage-playlist.component.css']
})
export class ManagePlaylistComponent implements OnInit {

  activeAction: eAction = eAction.add;

  constructor() { }

  ngOnInit(): void {
  }

}
