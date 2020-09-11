import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  isShowFullSong: boolean = false;
  constructor() { }

  ngOnInit() {
  }

  songSelected(isSongSelected: boolean): void {
    this.isShowFullSong = isSongSelected;
    console.log('show fullll bsd');
  }

}
