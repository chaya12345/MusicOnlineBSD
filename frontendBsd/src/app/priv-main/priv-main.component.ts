import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { AudioPlaying } from '../classes/audioPlaying';
import { Song } from '../classes/song';
import { UserPlaylists } from "../classes/UserPlaylists";
import { SongsToPlaylistsService } from '../services/songs-to-playlists.service';
import { StorageService } from '../services/storage.service';
import { UserPlaylistsService } from '../services/user-playlists.service';

export class SongsToPlaylistObj {
  id: number;
  songs: Song[] = [];
}

@Component({
  selector: 'priv-main',
  templateUrl: './priv-main.component.html',
  styleUrls: ['./priv-main.component.css']
})
export class PrivMainComponent implements OnInit {

  playlists: UserPlaylists[] = [];
  stpObj: SongsToPlaylistObj[] = [];
  @Output() sendPlaylist: EventEmitter<Song[]> = new EventEmitter();
  @Output() onPlay: EventEmitter<AudioPlaying> = new EventEmitter();

  index: number = 0;
  isPlay: boolean = false;
  playingSongId: number = -1;
  songsToPlaylist:Song[]=[];

  constructor(private userPlaylistsService: UserPlaylistsService, private songsToPlaylistService: SongsToPlaylistsService,
    private storageService:StorageService) {
    this.getPlaylists();
  }

  ngOnInit(): void {
    this.storageService.watchStorage().subscribe((data: string) => {
      if (data == "index") {
        this.index = parseInt(sessionStorage.getItem("index"));
      }
      else if (data == "playing") {
        if (sessionStorage.getItem("playing") == "true") {
          this.playingSongId = this.songsToPlaylist[this.index].id;
        }
        else {
          this.playingSongId = -1;
        }
      }
    });
  }

  getPlaylists(): void {
    try {
      this.userPlaylistsService.GetPlaylistsByUserId(10).subscribe(playlists => {
        this.playlists = playlists;
        this.playlists.forEach(element => {
          this.getSongsToPlaylist(element.id);
        });
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getSongsToPlaylist(playlistId: number): void {
    try {
      this.songsToPlaylistService.getSongsToPlaylists(playlistId).subscribe(result => {
        let stp = new SongsToPlaylistObj();
        stp.id = playlistId;
        stp.songs = result;
        this.stpObj.push(stp);
        console.log(this.stpObj);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  h(playlist) {
    console.log(this.stpObj[this.playlists.indexOf(playlist)].songs);
  }
  movePlaylist(songList: Song[]) {
    this.songsToPlaylist=songList;
    this.sendPlaylist.emit(songList);
  }
  play(song: Song): void {
    this.isPlay = true;
    this.playingSongId = this.songsToPlaylist[this.index].id;
    let obj = new AudioPlaying();
    obj.index = this.songsToPlaylist.findIndex(x=>x.id==song.id);
    obj.play = true;
    this.onPlay.emit(obj);
  }

  pause(song: Song) {
    this.isPlay = false;
    this.playingSongId = -1;
    let obj = new AudioPlaying();
    obj.index =this.songsToPlaylist.findIndex(x=>x.id==song.id);
    obj.play = false;
    this.onPlay.emit(obj);
  }
  toggle(songsList:Song[],song: Song): void {
    this.movePlaylist(songsList);
    if (this.isPlay == false || this.index != this.songsToPlaylist.findIndex(x=>x.id==song.id)) {
      this.play(song);
    }
    else {
      this.pause(song);
    }
  }

}
