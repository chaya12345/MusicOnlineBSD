import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ShareDataService } from '../services/share-data.service';

@Component({
  selector: 'private-area',
  templateUrl: './private-area.component.html',
  styleUrls: ['./private-area.component.css']
})
export class PrivateAreaComponent implements OnInit {

  constructor(private activatedRoute: ActivatedRoute, private shareDataService: ShareDataService) {
    if (this.activatedRoute.snapshot.queryParams.userId) {
      console.log("Yes");
      if (this.shareDataService.userConnectedEventListner()) {
        console.log("this.shareDataService.userConnectedEventListner()>>>>>>>");
        this.shareDataService.userConnectedEventListner().subscribe(user => console.log(user));
        console.log();
      }
    }
    else {
      console.log("No");
    }
   }

  ngOnInit(): void {
  }

}
