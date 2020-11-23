import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { User } from '../classes/user';
import { ShareDataService } from '../services/share-data.service';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'private-area',
  templateUrl: './private-area.component.html',
  styleUrls: ['./private-area.component.css']
})
export class PrivateAreaComponent implements OnInit {

  user: User;
  constructor(private activatedRoute: ActivatedRoute, private shareDataService: ShareDataService,
    private usersService: UsersService) {
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
    try {
      this.usersService.getUsers().subscribe(
        users=>
        users.forEach(element => {
          if(element.id==10)
          this.user=element;
        }),err=>console.log(err))
    } catch (err) { console.log(err) }
  }

  ngOnInit(): void {
  }

}
