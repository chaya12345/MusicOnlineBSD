import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { Song } from '../classes/song';
import { HttpClient } from '@angular/common/http';
import { ShareDataService } from '../services/share-data.service';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { TagsToSongsService } from '../services/tags-to-songs.service';
import { ActivatedRoute, Router } from '@angular/router';
import { SongService } from '../services/song.service';

@Component({
  selector: 'full-song',
  templateUrl: './full-song.component.html',
  styleUrls: ['./full-song.component.css']
})
export class FullSongComponent implements OnInit {

  songsList: Song[] = [];
  songId: number;
  song: Song;
  songContent: string;
  songSrc: string;
  httpClient;
  tags: string[] = [];
  responses: ResponsesToSongs[] = [];
  video: HTMLVideoElement;

  /*--- audio ---*/
  msbapAudioUrl;
  msbapTitle;
  msbapDisplayTitle;
  msbapDisplayVolumeControls;
  msbapDisablePositionSlider;

  constructor(private shareDataService: ShareDataService, http: HttpClient, private responseToSongsService: ResponseToSongsService,
    private tagsToSongsService: TagsToSongsService, public activatedRoute: ActivatedRoute, public songService: SongService,
    public location: Location, public router: Router) {
    this.httpClient = http;
    // this.song = shareDataService.currentSong;
  }

  ngOnInit() {
    // this.shareDataService.childEventListner().subscribe(song => {
    //   this.song = song;
    //   try {
    //     this.getContent();
    //     this.setSongSrc();
    //     this.getResponses();
    //     this.getTags();
    //     console.log(song);
    //   }
    //   catch { console.log('full-song'); }
    // });
    try {
      this.songId = parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
      console.log('song id: ' + this.songId);
      this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.filter(); }, err => { console.log(err); });
    } catch { console.log('full-song navigate'); }

    // this.router.events.subscribe(val => {
    //   try {
    //     this.songId = parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
    //     console.log('song id: ' + this.songId);
    //     this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.filter(); }, err => { console.log(err); });
    //   } catch { console.log('full-song navigate'); }
    // });
    this.activatedRoute.url.subscribe(url =>{
      // Code to get the new notification data 
      // and display it
      try {
        this.songId = parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
        console.log('song id: ' + this.songId);
        this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.filter(); }, err => { console.log(err); });
      } catch { console.log('full-song navigate'); }
  });
  }

  filter(): void {
    this.songsList.forEach(song => {
      if (song.id == this.songId)
        this.song = song;
    });
    if (this.song != null) {
      this.getContent();
      this.setSongSrc();
      this.getResponses();
      this.getTags();
    }
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

    /*--- audio ---*/
    this.msbapAudioUrl = '../../assets/songs/' + this.song.file_location;
    this.msbapTitle = this.song.title;
    this.msbapDisplayTitle = false;
    this.msbapDisplayVolumeControls = true;
    this.msbapDisablePositionSlider = true;
  }

  getResponses(): void {
    this.responseToSongsService.getSongResponses(this.song.id)
      .subscribe(response => { this.responses = response; }, err => { console.log(err); });
  }

  getTags(): void {
    this.tagsToSongsService.GetTagsIncludeArtistsToSong(this.song.id)
      .subscribe(tag => { this.tags = tag; }, err => { console.log(err); });
  }

}
