import { CdkDragDrop, moveItemInArray } from '@angular/cdk/drag-drop';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AudioPlaying } from '../classes/audioPlaying';
import { Song } from '../classes/song';
import { LikeService } from '../services/like.service';
import { SongService } from '../services/song.service';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'songs-in-playlist',
  templateUrl: './songs-in-playlist.component.html',
  styleUrls: ['./songs-in-playlist.component.css']
})
export class SongsInPlaylistComponent implements OnInit {

  @Input() songsToPlaylist: Song[] = [];
  @Output() onPlay = new EventEmitter<AudioPlaying>();

  playingSongId: number = -1;
  index: number = 0;
  isPlay: boolean = false;
  toggleLike: boolean = false;

  constructor(private storageService: StorageService, private likeService: LikeService,
    private songService: SongService,private activatedRoute:ActivatedRoute) { }

  ngOnInit() {
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

  drop(event: CdkDragDrop<string[]>) {
    moveItemInArray(this.songsToPlaylist, event.previousIndex, event.currentIndex);
  }

  ngOnChanges(): void {
  }

  toggle(song: Song): void {
    if (this.isPlay == false || this.index != this.songsToPlaylist.indexOf(song)) {
      this.play(song);
    }
    else {
      this.pause(song);
    }
  }

  play(song: Song): void {
    this.isPlay = true;
    this.playingSongId = this.songsToPlaylist[this.index].id;
    let obj = new AudioPlaying();
    obj.index = this.songsToPlaylist.indexOf(song);
    obj.play = true;
    this.onPlay.emit(obj);
  }

  pause(song: Song) {
    this.isPlay = false;
    this.playingSongId = -1;
    let obj = new AudioPlaying();
    obj.index = this.songsToPlaylist.indexOf(song);
    obj.play = false;
    this.onPlay.emit(obj);
  }

  changeColor(event) {
    this.likeService.change_like_color(event,'#F44336');
  }

  resetColor(event) {
    this.likeService.reset_like_color(event,'black');
  }

  sign(event): void {
    this.likeService.toggle_like(event);
    this.toggleLike == false ? this.addLike() : this.MissLike();
    this.toggleLike = !this.toggleLike;
  }

  addLike(): void {
    this.songService.increaseLikeToSong(Number(this.activatedRoute.snapshot.queryParams.songId)).subscribe();
  }

  MissLike(): void {
    this.songService.decreaseLikeToSong(Number(this.activatedRoute.snapshot.queryParams.songId)).subscribe();
  }
}
