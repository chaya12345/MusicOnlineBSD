import { Component, Input, OnInit } from '@angular/core';
import { promise } from 'protractor';
import { Singer } from '../classes/singer';
import { AllTags } from '../classes/tag';
import { User } from '../classes/user';
import { GroupByType } from '../searching-area/searching-area.component';
import { SingerSearchingToUserService } from '../services/singer-searching-to-user.service';
import { SingerService } from '../services/singer.service';

@Component({
  selector: 'tags',
  templateUrl: './tags.component.html',
  styleUrls: ['./tags.component.css']
})
export class TagsComponent implements OnInit {

  @Input() tagsList?: string[] = [];
  @Input() groupTag?: GroupByType = null;
  singersList:string[]=[];

  constructor(private singerService: SingerService, private singerSearchingToUserService: SingerSearchingToUserService) {
    this.singerService.getSingers().subscribe(singers=>{
      singers.forEach(singer=>{
        this.singersList.push(singer.name);
      });
    });
  }

  ngOnInit() {
  }

  searching(tag: string) {
    if (this.singersList.indexOf(tag)!=-1) {
      this.singerService.addSearchingToSinger(tag).subscribe();
      if (sessionStorage.getItem('user') != null && sessionStorage.getItem('user') != undefined) {
        let user: User = JSON.parse(sessionStorage.getItem('user'));
        this.singerSearchingToUserService.addSingerSearchingToUser(user.id, tag).subscribe();
      }
    }
  }
}
