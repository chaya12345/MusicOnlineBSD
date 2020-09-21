import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { Song } from '../classes/song';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { TagsToSongsService } from '../services/tags-to-songs.service';

@Component({
  selector: 'main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  @Input() song: Song;
  songContent: string;
  tags: string[] = [];
  responses: ResponsesToSongs[] = [];

  constructor(private httpClient: HttpClient, private responseToSongsService: ResponseToSongsService, 
    private tagsToSongsService: TagsToSongsService) { }

  ngOnInit() {
  }

  ngOnChanges(): void {
    try {
    this.getContent();
    this.getTags();
    this.getResponses();
    } catch { }
  }

  getContent(): void {
    this.httpClient.get('../../assets/text/' + this.song.content, {
      responseType: 'text'
    }).subscribe(data => { this.songContent = data; });
  }

  getTags(): void {
    this.tagsToSongsService.GetTagsIncludeArtistsToSong(this.song.id)
      .subscribe(tag => { this.tags = tag; }, err => { console.log(err); });
  }

  getResponses(): void {
    this.responseToSongsService.getSongResponses(this.song.id)
      .subscribe(response => { this.responses = response; }, err => { console.log(err); });
  }

}
