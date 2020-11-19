import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'playlist-folder',
  templateUrl: './playlist-folder.component.html',
  styleUrls: ['./playlist-folder.component.css']
})
export class PlaylistFolderComponent implements OnInit {

  @Input() name: string = "";
  @Input() date: Date;

  constructor() { }

  ngOnInit(): void {
  }

}
