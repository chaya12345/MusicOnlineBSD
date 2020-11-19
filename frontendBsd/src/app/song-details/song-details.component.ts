import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Song } from '../classes/Song';
import { SongService } from '../services/song.service';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';

@Component({
  selector: 'song-details',
  templateUrl: './song-details.component.html',
  styleUrls: ['./song-details.component.css']
})
export class SongDetailsComponent implements OnInit {

  public Editor = ClassicEditor;
  htmlContent;

  songId: number;
  @Input() song: Song;
  navs: string[] = [];
  songContent: string = "";
  similarSongs: Song[] = [];

  constructor(private httpClient: HttpClient, private songService: SongService,
    private router: Router, private activatedRoute: ActivatedRoute) {
    this.navs.push("חדש במוזיקה");
    //TO-DO
    // try {
    //   let id: number = Number(this.activatedRoute.snapshot.queryParams.songId);
    //   songService.addViewToSong(id).subscribe();
    // } catch (err) { console.log(err); }
  }

  ngOnInit() {
  }

  onRefresh() {
    this.router.routeReuseStrategy.shouldReuseRoute = function () { return false; };
    let currentUrl = this.router.url + '?';
    this.router.navigateByUrl(currentUrl)
      .then(() => {
        this.router.navigated = false;
        this.router.navigate([this.router.url]);
      });
  }

  ngOnChanges(): void {
    try {
      this.navs.push(this.song.title);
      // this.getContent();
      this.getSimilarResults();
    } catch { }
  }

  // getContent(): void {
  //   this.httpClient.get('../../assets/text/' + this.song.content, {
  //     responseType: 'text'
  //   }).subscribe(data => { this.songContent = data; });
  // }

  getSimilarResults(): void {
    try {
      this.songService.getSimilarSongs(this.song.id)
        .subscribe(song => { this.similarSongs = song; this.filter(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
  }

  filter(): void {
    this.similarSongs = this.similarSongs.slice(0, 3);
  }

}
