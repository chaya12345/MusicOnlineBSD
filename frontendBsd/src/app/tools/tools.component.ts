import { EventEmitter } from '@angular/core';
import { Component, Input, OnInit, Output } from '@angular/core';
import { MatDialog, MatSnackBar } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { FollowUp } from '../classes/followUp';
import { Update } from '../classes/update';
import { User } from '../classes/user';
import { LogInComponent } from '../log-in/log-in.component';
import { MessageComponent } from '../message/message.component';
import { FollowUpService } from '../services/follow-up.service';
import { UpdateService } from '../services/update.service';

@Component({
  selector: 'tools',
  templateUrl: './tools.component.html',
  styleUrls: ['./tools.component.css']
})
export class ToolsComponent implements OnInit {

  //@Output() onOrder: EventEmitter<string> = new EventEmitter<string>();
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
  loading: boolean = false;

  constructor(public router: Router, private followUpService: FollowUpService, private activatedRoute: ActivatedRoute,
    public dialog: MatDialog, private _snackBar: MatSnackBar, private updateService: UpdateService) {
  }

  ngOnInit() {
    if (sessionStorage.getItem('user') != (null || undefined)) {
      this.user = JSON.parse(sessionStorage.getItem('user'));
      this.id = Number(this.activatedRoute.snapshot.paramMap.get("id"));
      if (this.activatedRoute.snapshot.routeConfig.path.includes("article") == true) {
        this.followUpService.IsUserFollowUpArticle(this.user.id, this.id).subscribe(res => {
          if (res == true)
            this.followedUp = true;
          else
            this.followedUp = false;
        })
      }
      if (this.activatedRoute.snapshot.routeConfig.path.includes("song") == true) {
        this.followUpService.IsUserFollowUpSong(this.user.id, this.id).subscribe(res => {
          if (res == true)
            this.followedUp = true;
          else
            this.followedUp = false;
        })
      }
    }

  }

  logIn(num: number) {
    try {
      const dialogRef = this.dialog.open(LogInComponent, {
        width: '400px',
        data: {}
      });
      dialogRef.afterClosed().subscribe(result => {
        if (sessionStorage.getItem('user') != (null || undefined))
          num == 1 ? this.addFollowUp() : this.deleteFollowUp();
      });
    } catch (err) { console.log(err); }
  }

  order(value: string): void {
   this.router.navigateByUrl('song/'+this.activatedRoute.snapshot.paramMap.get('filter')+'/order/'+value);
  }

  addFollowUp() {
    if (sessionStorage.getItem('user') != (null || undefined)) {
      this.user = JSON.parse(sessionStorage.getItem('user'));
      this.id = parseInt(this.activatedRoute.snapshot.paramMap.get("id"));
      this.newFollow.userId = this.user.id;
      if (this.activatedRoute.snapshot.routeConfig.path.includes("article") == true)
        this.newFollow.articleId = this.id;
      else this.newFollow.songId = this.id;
      try {
        this.loading = true;
        this.followUpService.addFollowUp(this.newFollow)
          .subscribe(() => { this.openSnackBar("המעקב נוסף בהצלחה!"); this.followedUp = true; }, err => console.log(err));
      } catch (err) {
        console.log(err); this.openSnackBar("פעולה נכשלה. נסה שוב מאוחר יותר");
        this.updateWebmaster("הוספת מעקב", this.user.id, this.id, this.newFollow.songId ? "song" : "article"); }
      finally { this.loading = false; }
    }
    else
      this.logIn(1);
  }

  deleteFollowUp() {
    this.openMessageDialog("האם אתה בטוח שברצונך להסיר מעקב?");
  }

  delete() {
    this.user = JSON.parse(sessionStorage.getItem('user'));
    this.id = Number(this.activatedRoute.snapshot.paramMap.get("id"));
    if (this.activatedRoute.snapshot.routeConfig.path.includes("article") == true)
      try {
        this.loading = true;
        this.followUpService.deleteFollowUp(this.user.id, this.id, 'article')
          .subscribe(() => { this.openSnackBar("המעקב הוסר בהצלחה!"); this.followedUp = false; }, err => console.log(err));
      } catch (err) { console.log(err); this.openSnackBar("פעולה נכשלה. נסה שוב מאוחר יותר");
        this.updateWebmaster("הסרת מעקב", this.user.id, this.id, this.newFollow.songId ? "song" : "article"); }
      finally { this.loading = false; }
    else
      try {
        this.loading = true;
        this.followUpService.deleteFollowUp(this.user.id, this.id, 'song')
          .subscribe(() => { this.openSnackBar("המעקב הוסר בהצלחה!"); this.followedUp = false; }, err => console.log(err));
      } catch (err) { console.log(err); this.openSnackBar("פעולה נכשלה. נסה שוב מאוחר יותר");
        this.updateWebmaster("הסרת מעקב", this.user.id, this.id, this.newFollow.songId ? "song" : "article"); }
      finally { this.loading = false; }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true) {
          if (sessionStorage.getItem('user') == (null || undefined)) {
            this.logIn(2);
          }
          if (sessionStorage.getItem('user') != (null && undefined)) {
            this.delete();
          }
        }
      });
    } catch (err) { console.log(err); this.openSnackBar("קרתה תקלה. נסה שוב מאוחר יותר");
      this.updateWebmaster("הצגת דיאלוג בעת בקשה להסרת מעקב", this.user.id, this.id, this.newFollow.songId ? "song" : "article"); }
  }

  updateWebmaster(matter: string, usreId: number, itemId: number, itemType: string): void {
    let update: Update = new Update();
    if (matter == "הוספת מעקב" || matter == "הסרת מעקב") {
      update.title = "דיווח על פעולה שנכשלה";
      let type: string = "";
      if (itemType == "song")
        type == "שיר";
      else if (itemType == "song")
        type = "כתבה";
      else
        type == "-זיהוי נכשל-"
      update.message = " נכשלה פעולת " + matter + " ל " + type + " מספר " + itemId + ". " +
        " הפעולה בוצעה ע\"י משתמש מספר" + usreId + " בתאריך " + new Date().toLocaleDateString() + " ,בשעה " + new Date().toLocaleTimeString();
    }
    try {
      this.updateService.addUpdate(update).subscribe(err => console.log(err));
    } catch (err) { console.log(err); }
  }
}
