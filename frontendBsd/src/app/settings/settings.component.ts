import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { UsersService } from '../services/users.service';

class TabObj {
  name: string;
  icon: string;
  constructor (name: string, icon: string) {
    this.name = name;
    this.icon = icon;
  }
}

@Component({
  selector: 'settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.css']
})
export class SettingsComponent implements OnInit {

  permission: boolean = false;
  tabs: TabObj[] = [
    new TabObj("כללי", "reorder"),
    new TabObj("ניהול שירים", "headset"),
    new TabObj("ניהול מגזין", "queue_music"),
    new TabObj("ניהול פלייליסטים", "equalizer"),
    new TabObj("סקרים", "timeline"),
  ]

  constructor(private usersService: UsersService, private activatedRoute: ActivatedRoute) {
    try {
      parseInt(this.activatedRoute.snapshot.queryParams.manager);
      if (this.usersService.getManager(parseInt(this.activatedRoute.snapshot.queryParams.manager)) != null) {
        this.permission = true;
      }
    } catch { this.permission = false; }
  }

  ngOnInit(): void {
  }

}
