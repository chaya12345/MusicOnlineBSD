import { Component, OnInit } from '@angular/core';
import { SongService } from '../services/song.service';
import { Song } from '../classes/song';
import { HttpClient } from '@angular/common/http';
import { TagsToSongsService } from '../services/tags-to-songs.service';

@Component({
  selector: 'full-song',
  templateUrl: './full-song.component.html',
  styleUrls: ['./full-song.component.css']
})
export class FullSongComponent implements OnInit {

  songsList: Song[] = [];
  songsWithContent: Song[] = [];
  song: Song;
  songContent: string;
  httpClient;
  // _tagsToSongsService;
  tags: string[] = [];

  constructor(private songService: SongService, http: HttpClient/*, tagsToSongsService = TagsToSongsService*/) {
    songService.getSongs().subscribe(song => { this.songsList = song; this.filter(); this.getContent(); this.getTags(); }, err => { console.log(err); });
    this.httpClient = http;
    // this._tagsToSongsService = tagsToSongsService;
  }

  ngOnInit() {
  }

  filter(): void {
    this.songsList.forEach(song => {
      if (song.content != null && song.content != undefined)
        this.songsWithContent.push(song);
    });
    console.log(this.songsWithContent);
    this.song = this.songsWithContent[0];
  }

  getContent(): void {
    this.httpClient.get('../../assets/text/'+this.song.content, {
      responseType: 'text', headers: {
        "Accept": "application/txt;charset=utf-8",
        "Accept-Charset": "charset=utf-8"
      }
    }).subscribe(data => { this.songContent = data; console.log(data); this.filter() });
  }

  getTags(): void {
    // this._tagsToSongsService.GetTagsNamesToSong().subscribe(tag => { this.tags = tag; }, err => { console.log(err); });
    this.tags = ["אברהם פריד", "סינגל", "קצבי", "חסידי", "קליפ"];
  }

}
