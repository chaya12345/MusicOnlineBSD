import { Component, Input, OnInit } from '@angular/core';
import { Song } from '../classes/song';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'player-details',
  templateUrl: './player-details.component.html',
  styleUrls: ['./player-details.component.css']
})
export class PlayerDetailsComponent implements OnInit {

  @Input() songsList: Song[] = [];
  index: number = 0;

  constructor(private storageService: StorageService) { }

  ngOnInit(): void {
    this.storageService.watchStorage().subscribe((data: string) => {
      if (data == "index") {
        this.index = parseInt(sessionStorage.getItem("index"));
      }
    });
  }

  ngOnChanges(): void {
  }

}
