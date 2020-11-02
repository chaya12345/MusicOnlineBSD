import { Component, OnInit } from '@angular/core';
import { StorageService } from '../services/storage.service';

@Component({
  selector: 'custom-tool-bar',
  templateUrl: './custom-tool-bar.component.html',
  styleUrls: ['./custom-tool-bar.component.css']
})
export class CustomToolBarComponent implements OnInit {

  currentOrder: string = "date";
  currentDirection: boolean = false;

  constructor(private storageService: StorageService) { }

  ngOnInit(): void {
    window.onscroll = function() {
      var currentScrollPos = window.pageYOffset;
      console.log(currentScrollPos);
      if (currentScrollPos > 20) {
        document.getElementById("customToolbar").style.color = "red";
      } else {
        document.getElementById("customToolbar").style.color = "yellow";
      }
    }
  }

  ngOnChanges() {
    window.onscroll = function() {
      var currentScrollPos = window.pageYOffset;
      console.log(currentScrollPos);
      if (currentScrollPos > 20) {
        document.getElementById("customToolbar").style.color = "red";
      } else {
        document.getElementById("customToolbar").style.color = "yellow";
      }
    }
  }

  saveOrderType(orderType: string): void {
    this.currentOrder = orderType;
    this.storageService.setItem("order-type", orderType);
    this.storageService.setItem("reverse", orderType != "song" ? 0 : 1);
  }

}
