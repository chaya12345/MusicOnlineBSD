import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ResponsesToSongs } from '../classes/responsesToSongs';
import { ResponseToSongsService } from '../services/response-to-songs.service';

@Component({
  selector: 'responses-song',
  templateUrl: './responses-song.component.html',
  styleUrls: ['./responses-song.component.css']
})
export class ResponsesSongComponent implements OnInit {
  
  // @Input() responses: ResponsesToSongs[] = [];
  responses: ResponsesToSongs[] = [];

  constructor(private responseToSongsService: ResponseToSongsService, private activatedRoute: ActivatedRoute,
    private cdr: ChangeDetectorRef) { }

  ngOnInit() {
    try {
    this.getResponses();
    } catch { }
  }

  ngOnChanges(): void {
    try {
    this.getResponses();
    } catch { }
  }

  getResponses(): void {
    this.responseToSongsService.getSongResponses(parseInt(this.activatedRoute.snapshot.paramMap.get('id')))
      .subscribe(response => { this.responses = response; this.orderResponses(); 
        this.cdr.detectChanges(); }, err => { console.log(err); });
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
