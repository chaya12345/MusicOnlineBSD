import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ItemsByParameter } from '../classes/itemsByParameter';
import { User } from '../classes/user';
import { ItemsByParameterService } from '../services/items-by-parameter.service';
import { SearchingsOfUserService } from '../services/searchings-of-user.service';

@Component({
  selector: 'filtered-songs',
  templateUrl: './filtered-songs.component.html',
  styleUrls: ['./filtered-songs.component.css']
})
export class FilteredSongsComponent implements OnInit {

  items: ItemsByParameter[] = [];
  navs: string[] = [];
  title: string;
  subtitle: string;
  img: string;

  constructor(private itemsByParameterService: ItemsByParameterService, private cdr: ChangeDetectorRef,
    private activatedRoute: ActivatedRoute, private searchingOfUserService: SearchingsOfUserService) {
    let filter = this.activatedRoute.snapshot.queryParams.filter;
    this.getItemsByFilter(filter);
    this.addSearchingToUser(filter);
    this.navs.push("חדש במוזיקה");
  }

  ngOnInit(): void {
  }

  getItemsByFilter(filter: string): void {
    try {
      this.itemsByParameterService.getItemsByParameter(filter).subscribe(items => {
        this.items = items;
        this.cdr.detectChanges();
        this.items.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
        this.navs.push(filter);
      }, err => console.log(err))
    } catch (err) { console.log(err); }
    try {
      this.itemsByParameterService.getItemByName(filter).subscribe(item => {
        this.title = item.name;
        this.subtitle = "כל השירים, הקליפים, ההופעות והכתבות";
        this.img = item.image ? "../../assets/images/" + item.image : null;
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }

  addSearchingToUser(item: string) {
    if ((sessionStorage.getItem("user") != null && sessionStorage.getItem("user") != undefined) ||
      (localStorage.getItem("user") != null && localStorage.getItem("user") != undefined)) {
      let user: User = JSON.parse(sessionStorage.getItem("user") || localStorage.getItem("user"));
      try {
        this.searchingOfUserService.addSearchingsToUser(user.id, item).subscribe();
      } catch (err) { console.log(err); }
    }
  }

}
