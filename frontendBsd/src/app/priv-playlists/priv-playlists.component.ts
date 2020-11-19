import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'priv-playlists',
  templateUrl: './priv-playlists.component.html',
  styleUrls: ['./priv-playlists.component.css']
})
export class PrivPlaylistsComponent implements OnInit {

  step = 0;

  setStep(index: number) {
    this.step = index;
  }

  constructor() { }

  ngOnInit(): void {
  }

}