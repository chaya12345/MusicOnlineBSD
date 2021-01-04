import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { Report } from '../classes/report';
import { Song } from '../classes/song';
import { DialogData } from '../reporting/reporting.component';
import { SongService } from '../services/song.service';

export interface ReportDetailsDialog{
  report:Report;
}
@Component({
  selector: 'report-details',
  templateUrl: './report-details.component.html',
  styleUrls: ['./report-details.component.css']
})
export class ReportDetailsComponent implements OnInit {

  song: Song;
  report:Report;
  constructor(public dialogRef: MatDialogRef<ReportDetailsComponent>, @Inject(MAT_DIALOG_DATA) public data: ReportDetailsDialog,
    private songService: SongService) {
      this.report=this.data.report;
    this.songService.getSongById(this.report.songId).subscribe(song => this.song = song, err => console.log(err));
  }

  ngOnInit(): void {
  }
  onNoClick(): void {
    this.dialogRef.close();
  }

}
