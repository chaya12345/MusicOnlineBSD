import { EventEmitter } from '@angular/core';
import { Component, Input, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { FollowUp } from '../classes/followUp';
import { User } from '../classes/user';
import { RegisterToWebsiteComponent } from '../register-to-website/register-to-website.component';
import { FollowUpService } from '../services/follow-up.service';

@Component({
  selector: 'tools',
  templateUrl: './tools.component.html',
  styleUrls: ['./tools.component.css']
})
export class ToolsComponent implements OnInit {

  @Output() onOrder: EventEmitter<string> = new EventEmitter<string>();
  @Input() searchBox?: boolean = false;
  @Input() followUp?: boolean = false;
  @Input() addToPlaylist?: boolean = false;
  @Input() orderBy?: boolean = false;
  @Input() sideText?: string = "";
  isChecked: boolean = false;
  followedUp: boolean = false;
  id: number;
  newFollow: FollowUp = new FollowUp;
  user: User;

  constructor(public router: Router, private followUpService: FollowUpService, private activatedRoute: ActivatedRoute,
    public dialog: MatDialog) {
    this.ngOnInit();
  }

  ngOnInit() {
    if (sessionStorage.getItem('user') != (null || undefined)) {
      this.user = JSON.parse(sessionStorage.getItem('user'));
      this.id = Number(this.activatedRoute.snapshot.paramMap.get("id"));
      if (this.activatedRoute.snapshot.routeConfig.path.includes("article") == true) {
        this.followUpService.getIsUserFollowUpArticle(this.user.id, this.id).subscribe(res => {
          if (res = true)
            this.followedUp = true;
        })
      }
      if (this.activatedRoute.snapshot.routeConfig.path.includes("song") == true) {
        this.followUpService.getIsUserFollowUpSong(this.user.id, this.id).subscribe(res => {
          if (res = true)
            this.followedUp = true;
        })
      }
    }

  }

  toggleFollowUp() {
    if (sessionStorage.getItem('user') != (null || undefined)) {
      if (this.followUp&&!this.followedUp) {
        this.addFollowUp();
      }
      else this.deleteFollowUp();
    }
    else {
      try {
        const dialogRef = this.dialog.open(RegisterToWebsiteComponent, {
          width: '400px',
          data: {}
        });
        dialogRef.afterClosed().subscribe(result => {
          if (sessionStorage.getItem('user') != (null || undefined))
            this.toggleFollowUp();
        });
      } catch (err) { console.log(err); }
    }
  }

  order(value: string): void {
    this.onOrder.emit(value);
  }
  addFollowUp() {
    this.user = JSON.parse(sessionStorage.getItem('user'));
    this.id = Number(this.activatedRoute.snapshot.paramMap.get("id"));
    this.newFollow.userId = this.user.id;
    if (this.activatedRoute.snapshot.routeConfig.path.includes("article") == true)
      this.newFollow.articleId = this.id;
    else this.newFollow.songId = this.id;
    this.followUpService.addFollowUp(this.newFollow).subscribe();
    this.followedUp=false;
  }
  deleteFollowUp() {
    this.user = JSON.parse(sessionStorage.getItem('user'));
    this.id = Number(this.activatedRoute.snapshot.paramMap.get("id"));
    if (this.activatedRoute.snapshot.routeConfig.path.includes("article") == true)
      this.followUpService.deleteFollowUp(this.user.id, this.id, 'article');
    else this.followUpService.deleteFollowUp(this.user.id, this.id, 'song');
    this.followedUp=true;
  }
}
