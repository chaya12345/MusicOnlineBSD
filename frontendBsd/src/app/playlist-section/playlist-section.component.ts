import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AudioPlaying } from '../classes/audioPlaying';
import { PlaylistSystem } from '../classes/playlistSystem';
import { Song } from '../classes/song';
import { PlaylistsSystemService } from '../services/playlists-system.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'playlist-section',
  templateUrl: './playlist-section.component.html',
  styleUrls: ['./playlist-section.component.css']
})
export class PlaylistSectionComponent implements OnInit {

  playlist: PlaylistSystem;
  navs: string[] = [];
  loaded: boolean = false;
  song: Song;
  songsList: Song[];
  playingObj: AudioPlaying = new AudioPlaying();

  constructor(private activatedRoute: ActivatedRoute, private playlistSystemService: PlaylistsSystemService,
    private cdr: ChangeDetectorRef, private songService: SongService) {
    try {
      this.playlistSystemService.getPlaylistById(Number(this.activatedRoute.snapshot.queryParams.playlistId))
      .subscribe(playlist => { 
        this.playlist = playlist;
        this.loaded = true;
        this.getSongs();
        this.navs.push(this.playlist.name);
        this.cdr.detectChanges();
      }, 
      err => console.log(err));
    } catch (err) { console.log(err); }
    this.navs.push("פלייליסטים");
    try {
      songService.getSongById(71).subscribe(song => this.song = song, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  ngOnInit() {
  }

  getSongs(): void {
    try {
      this.songService.getSongsByTagId(this.playlist.tagId)
      .subscribe(songs => { this.songsList = songs; this.cdr.detectChanges(); }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  updateIndex(obj: AudioPlaying): void {
    this.playingObj = obj;
  }

}
