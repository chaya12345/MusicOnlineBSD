import { HttpClient } from '@angular/common/http';
import { ChangeDetectorRef } from '@angular/core';
import { Component, Input, OnInit } from '@angular/core';
import { concatMap, startWith } from 'rxjs/operators';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { Song } from '../classes/song';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { ShareDataService } from '../services/share-data.service';
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
  refresh: boolean = false;

  constructor(private httpClient: HttpClient, private responseToSongsService: ResponseToSongsService, 
    private tagsToSongsService: TagsToSongsService, private cdr: ChangeDetectorRef) { }

  ngOnInit() {
  }

  ngOnChanges(): void {
    try {
      /*------ for deleting -------*/
    this.getContent();
    /*------ end -------*/
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

  /*------ for deleting -------*/
  getResponses(): void {
    this.responseToSongsService.getSongResponses(this.song.id)
      .subscribe(response => { this.responses = response; this.orderResponses(); 
        this.cdr.detectChanges(); }, err => { console.log(err); });
  }

  orderResponses(): void {
    this.responses.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }
  /*------ end -------*/

}
