import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { Song } from '../classes/song';
import { ResponseToSongsService } from '../services/response-to-songs.service';
import { SongService } from '../services/song.service';
import { TagsToSongsService } from '../services/tags-to-songs.service';

@Component({
  selector: 'full-song-bsd',
  templateUrl: './full-song-bsd.component.html',
  styleUrls: ['./full-song-bsd.component.css']
})
export class FullSongBsdComponent implements OnInit {

  currentSong: Song;
  tags: string[] = [];
  responses: ResponsesToSongs[] = [];

  constructor(private activatedRoute: ActivatedRoute, private songService: SongService,
    private tagsToSongsService: TagsToSongsService, private responseToSongsService: ResponseToSongsService,
    private router: Router) { }

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      this.initialiseState();
    });
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

  initialiseState(): void {
    this.songService.getSongById(parseInt(this.activatedRoute.snapshot.paramMap.get('id')))
      .subscribe(song => { this.currentSong = song; this.reloadData(); }, err => { console.log(err); });
  }

  reloadData(): void {
    this.getTags();
    this.getResponses();
  }

  getTags(): void {
    this.tagsToSongsService.GetTagsIncludeArtistsToSong(this.currentSong.id)
      .subscribe(tag => { this.tags = tag; }, err => { console.log(err); });
  }

  getResponses(): void {
    this.responseToSongsService.getSongResponses(this.currentSong.id)
      .subscribe(response => { this.responses = response; console.log('res'); console.log(this.responses); }, err => { console.log(err); });
  }

}
