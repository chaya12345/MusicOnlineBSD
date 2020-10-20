import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { element } from 'protractor';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { ResponseToSongsService } from '../services/response-to-songs.service';

@Component({
  selector: 'responses-song',
  templateUrl: './responses-song.component.html',
  styleUrls: ['./responses-song.component.css']
})
export class ResponsesSongComponent implements OnInit {

  responses: ResponsesToSongs[] = [];
  responseId: number;
  constructor(private responseToSongsService: ResponseToSongsService, private activatedRoute: ActivatedRoute,
    private cdr: ChangeDetectorRef) { }

  ngOnInit() {

    try {
      this.getResponses();
      if (this.activatedRoute.snapshot.paramMap.get("commitId") != (null || undefined)) {
        this.responseId = Number(this.activatedRoute.snapshot.paramMap.get("commitId"));
       console.log(this.responses.find(res=>res.id==this.responseId));
      }
    } catch { }
  }

  ngOnChanges(): void {
    try {
      this.getResponses();
    } catch { }
  }

  getResponses(): void {
    this.responseToSongsService.getSongResponses(parseInt(this.activatedRoute.snapshot.paramMap.get('id')))
      .subscribe(response => {
        this.responses = response; this.orderResponses();
        this.cdr.detectChanges();
      }, err => { console.log(err); });
  }

  orderResponses(): void {
    this.responses.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
  }

  updateData(e: ResponsesToSongs): void {
    e.date = new Date();
    this.responses.push(e);
    this.orderResponses();
  }

}
