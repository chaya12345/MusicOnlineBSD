import { Component, OnInit } from '@angular/core';
import { ShareDataService } from '../services/share-data.service';

@Component({
  selector: 'home-page',
  templateUrl: './home-page.component.html',
  styleUrls: ['./home-page.component.css']
})
export class HomePageComponent implements OnInit {

  isNarrow: boolean = false;

  constructor(private shareData: ShareDataService) { }

  ngOnInit() {
    this.shareData.childEventListner().subscribe(isNavOpened =>{
        this.isNarrow = isNavOpened;
     });
  }

}
