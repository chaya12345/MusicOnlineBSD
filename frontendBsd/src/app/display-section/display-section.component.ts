import { Component, Input, OnInit } from '@angular/core';
import { Article } from '../classes/article';
import { PlaylistSystem } from '../classes/playlistSystem';
import { Song } from '../classes/song';

@Component({
  selector: 'display-section',
  templateUrl: './display-section.component.html',
  styleUrls: ['./display-section.component.css']
})
export class DisplaySectionComponent implements OnInit {

  @Input() type: string = "";
  @Input() subject: string = "";
  @Input() count?: number;
  @Input() url: string = "";
  @Input() navigateText: string = "";

  @Input() songs?: Song[] = [];
  @Input() articles?: Article[] = [];
  @Input() playlists?: PlaylistSystem[] = [];
  @Input() dark?: boolean = false;

  constructor() { }

  ngOnInit(): void {
  }

}
