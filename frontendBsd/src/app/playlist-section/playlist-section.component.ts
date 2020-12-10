import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AudioPlaying } from '../classes/audioPlaying';
import { Playlists } from '../classes/playlists';
import { Song } from '../classes/song';
import { PlaylistsService } from '../services/playlists.service';
import { SongService } from '../services/song.service';
import { SongsToPlaylistsSystemService } from '../services/songs-to-playlists-system.service';

@Component({
  selector: 'playlist-section',
  templateUrl: './playlist-section.component.html',
  styleUrls: ['./playlist-section.component.css']
})
export class PlaylistSectionComponent implements OnInit {

  playlist: Playlists;
  navs: string[] = [];
  loaded: boolean = false;
  songsList: Song[];
  playingObj: AudioPlaying = new AudioPlaying();

  constructor(private activatedRoute: ActivatedRoute, private playlistService: PlaylistsService,
    private cdr: ChangeDetectorRef, private songService: SongService, private songsToPlaylistsSystemService: SongsToPlaylistsSystemService) {
    try {
      this.playlistService.getPlaylistById(parseInt(this.activatedRoute.snapshot.queryParams.playlistId))
        .subscribe(playlist => {
          this.playlist = playlist;
          this.loaded = true;
          this.navs.push(this.playlist.name);
          this.cdr.detectChanges();
        },
          err => console.log(err));
    } catch (err) { console.log(err); }
    this.navs.push("פלייליסטים");
    this.getSongs();
  }

  ngOnInit() {
  }

  getSongs(): void {
    try {
      this.songsToPlaylistsSystemService.getSongsToPlaylistSystem(parseInt(this.activatedRoute.snapshot.queryParams.playlistId))
        .subscribe(songs => { this.songsList = songs; this.cdr.detectChanges(); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  updateIndex(obj: AudioPlaying): void {
    this.playingObj = obj;
  }

}
