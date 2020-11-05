import { CdkDragDrop, moveItemInArray } from '@angular/cdk/drag-drop';
import { ChangeDetectorRef, Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AudioPlaying } from '../classes/audioPlaying';
import { PlaylistSystem } from '../classes/playlistSystem';
import { Song } from '../classes/song';
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

  constructor(private storageService: StorageService) { }

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

}
