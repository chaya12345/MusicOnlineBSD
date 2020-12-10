import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AudioPlaying } from '../classes/audioPlaying';
import { Song } from '../classes/song';
import { UserPlaylists } from "../classes/UserPlaylists";
import { SongsToPlaylistsService } from '../services/songs-to-playlists.service';

@Component({
  selector: 'user-active-playlist',
  templateUrl: './user-active-playlist.component.html',
  styleUrls: ['./user-active-playlist.component.css']
})
export class UserActivePlaylistComponent implements OnInit {

  @Input() playlist: UserPlaylists = null;
  songs: Song[] = [];
  playingObj: AudioPlaying = new AudioPlaying();
  @Output() onDragSong = new EventEmitter<Song>();

  constructor(private songsToPlaylistService: SongsToPlaylistsService) { }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    console.log(this.playlist);
    if (this.playlist != null)
      this.getSongsToPlaylist();
  }

  getSongsToPlaylist(): void {
    try {
      this.songsToPlaylistService.getSongsToPlaylists(this.playlist.id).subscribe(songs =>
        this.songs = songs, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  updateIndex(obj: AudioPlaying): void {
    this.playingObj = obj;
  }

  dragSong(song: Song) {
    this.onDragSong.emit(song);
  }

}
