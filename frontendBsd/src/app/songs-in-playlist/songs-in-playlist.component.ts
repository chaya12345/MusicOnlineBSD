import { CdkDragDrop, moveItemInArray } from '@angular/cdk/drag-drop';
import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
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

  playingSongId: number = -1;
  index: number = 0;

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

}
