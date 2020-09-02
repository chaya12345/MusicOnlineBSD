import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'favorite',
  templateUrl: './favorite.component.html',
  styleUrls: ['./favorite.component.css']
})
export class FavoriteComponent implements OnInit {

  favoriteSongs = [{
    name: "אנא", 
    title: "מאט דאב ואיציק דדיה בדואט: \"אנא\"",
    src: "",
    img: "../../assets/images/for-deleting/223388_tumb_750Xauto.jpg",
    singer_name: "איציק דדיה",
    like: "9",
    responses: "5"
  },{
    name: "נכספתי", 
    title: "איציק דדיה בסינגל חדש: \"נכספתי\"",
    src: "",
    img: "../../assets/images/for-deleting/211576_tumb_750Xauto.jpg",
    singer_name: "איציק דדיה",
    like: "12",
    responses: "7"
  },{
    name: "תן לי אור", 
    title: "\"תן לי אור\" - אבי אילסון בקליפ חדש",
    src: "",
    img: "../../assets/images/for-deleting/231862_tumb_750Xauto.jpg",
    singer_name: "אבי אילסון",
    like: "4",
    responses: "0"
  },{
    name: "מסיני בא", 
    title: "\"מסיני בא\" - יעקב שוואקי בסינגל חדש לקראת חתונת הבת",
    src: "",
    img: "../../assets/images/for-deleting/מסיני-בא-יעקב-שוואקי.jpeg",
    singer_name: "יעקב שוואקי",
    like: "6",
    responses: "1"
  }];

  constructor() { }

  ngOnInit() {
  }

}