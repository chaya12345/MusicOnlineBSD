import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material';
import { LogInComponent } from '../log-in/log-in.component';
import { MessageComponent } from '../message/message.component';

export interface messange {
  text: string;
}

@Component({
  selector: 'header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  constructor() {
  }

  ngOnInit(): void {
  }

  triggerClick() {
    // console.log(this.option);
    // let el: HTMLElement = this.option.nativeElement;
    let el: HTMLElement = document.querySelector('a.search-song')[0];
    console.log(el);
    el.click();
  }
  
}