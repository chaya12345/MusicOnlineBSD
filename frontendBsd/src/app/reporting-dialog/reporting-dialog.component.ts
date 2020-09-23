import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { DialogData } from '../reporting/reporting.component';
import { ArticleService } from '../services/article.service';
import { SongService } from '../services/song.service';

@Component({
  selector: 'reporting-dialog',
  templateUrl: './reporting-dialog.component.html',
  styleUrls: ['./reporting-dialog.component.css']
})
export class ReportingDialogComponent implements OnInit {

  name: string = "";

  constructor(public dialogRef: MatDialogRef<ReportingDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData, private router: Router,
    private activatedRoute: ActivatedRoute, private songService: SongService,
    private articleService: ArticleService) { }

  ngOnInit() {
    this.songService.getSongById(parseInt(this.data.songId)).subscribe(song => this.name = song.name, err => console.log(err));
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
