import { Component, Input, OnInit } from '@angular/core';
import { User } from '../classes/user';
import { FollowUpService } from '../services/follow-up.service';
import { SubscriptionService } from '../services/subscription.service';

@Component({
  selector: 'priv-info',
  templateUrl: './priv-info.component.html',
  styleUrls: ['./priv-info.component.css']
})
export class PrivInfoComponent implements OnInit {

  @Input() user: User;
  subsCount: number;
  songsInFollowUp: number = 4;
  articlesInFollowUp: number = 6;

  constructor(private subscriptionService: SubscriptionService, private followUpService: FollowUpService) {
  }

  ngOnInit(): void {
  }

  ngOnChanges(): void {
    try {
      this.subscriptionService.getYourSingersNameSubscription(this.user.id).subscribe(
        singerName => this.subsCount = singerName.length
        , err => console.log(err));
    } catch (err) { console.log(err); }
    try {
      this.followUpService.getSongsNameYouFollowUp(this.user.id).subscribe(
        songsName => this.songsInFollowUp = songsName.length, err => console.log(err))
    } catch (err) { console.log(err); }
    try {
      this.followUpService.getArticlesNameYouFollowUp(this.user.id).subscribe(
        articlesName => this.articlesInFollowUp = articlesName.length, err => console.log(err))
    } catch (err) { console.log(err); }
  }

}



