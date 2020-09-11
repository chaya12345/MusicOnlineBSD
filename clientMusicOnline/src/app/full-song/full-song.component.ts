import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { Song } from '../classes/song';
import { HttpClient } from '@angular/common/http';
import { ShareDataService } from '../services/share-data.service';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { TagsToSongsService } from '../services/tags-to-songs.service';

@Component({
  selector: 'full-song',
  templateUrl: './full-song.component.html',
  styleUrls: ['./full-song.component.css']
})
export class FullSongComponent implements OnInit {

  @Output() onSongSelected: EventEmitter<boolean> = new EventEmitter<boolean>();
  song: Song;
  songContent: string;
  songSrc: string;
  httpClient;
  tags: string[] = [];
  responses: ResponsesToSongs[] = [];
  video: HTMLVideoElement;

  constructor(private shareDataService: ShareDataService, http: HttpClient, private responseToSongsService: ResponseToSongsService,
    private tagsToSongsService: TagsToSongsService) {
    this.httpClient = http;
    this.song = shareDataService.currentSong;
  }

  ngOnInit() {
    this.shareDataService.childEventListner().subscribe(song => {
      this.song = song;
      try {
        this.getContent();
        this.setSongSrc();
        this.getResponses();
        this.getTags();
        this.emit();
        console.log(song);
      }
      catch { console.log('full-song'); }
    });
  }

  getContent(): void {
    this.httpClient.get('../../assets/text/' + this.song.content, {
      responseType: 'text', headers: {
        "Accept": "application/txt;charset=utf-8",
        "Accept-Charset": "charset=utf-8"
      }
    }).subscribe(data => { this.songContent = data; });
  }

  setSongSrc(): void {
    this.songSrc = '../../assets/songs/' + this.song.file_location;
    this.video = document.querySelector('video');
    this.video.load();
  }

  getResponses(): void {
    this.responseToSongsService.getSongResponses(this.song.id)
      .subscribe(response => { this.responses = response; }, err => { console.log(err); });
  }

  getTags(): void {
    this.tagsToSongsService.getTagsNamesToSong(this.song.id)
      .subscribe(tag => { this.tags = tag; }, err => { console.log(err); });
  }

  emit(): void {
    this.onSongSelected.emit(true);
  }

}
