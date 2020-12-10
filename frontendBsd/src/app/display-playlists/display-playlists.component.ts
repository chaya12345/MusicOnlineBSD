import { Component, Input, OnInit } from '@angular/core';
import { Playlists } from '../classes/playlists';

@Component({
  selector: 'display-playlists',
  templateUrl: './display-playlists.component.html',
  styleUrls: ['./display-playlists.component.css']
})
export class DisplayPlaylistsComponent implements OnInit {

  @Input() playlists: Playlists[] = [];
  @Input() count?: number;

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    if (this.count != null && this.count != undefined) {
      this.playlists = this.playlists.slice(0, this.count);
    }
  }

}
