import { Component, OnInit } from '@angular/core';
import { Song } from '../classes/song';

@Component({
  selector: 'clips',
  templateUrl: './clips.component.html',
  styleUrls: ['./clips.component.css']
})
export class ClipsComponent implements OnInit {

  clipsList: Song[] = [{
    id: 12,
    name: "אנא", 
    title: "מאט דאב ואיציק דדיה בדואט: \"אנא\"",
    file_location: "",
    image_location: "../../assets/images/for-deleting/223388_tumb_750Xauto.jpg",
    singerId: 4,
    count_like: 9,
    count_views: 17
  },{
    id: 13,
    name: "נכספתי", 
    title: "איציק דדיה בסינגל חדש: \"נכספתי\"",
    file_location: "",
    image_location: "../../assets/images/for-deleting/211576_tumb_750Xauto.jpg",
    singerId: 4,
    count_like: 12,
    count_views: 23
  },{
    id: 14,
    name: "תן לי אור", 
    title: "\"תן לי אור\" - אבי אילסון בקליפ חדש",
    file_location: "",
    image_location: "../../assets/images/for-deleting/231862_tumb_750Xauto.jpg",
    singerId: 5,
    count_like: 4,
    count_views: 10
  },{
    id: 15,
    name: "מסיני בא", 
    title: "\"מסיני בא\" - יעקב שוואקי בסינגל חדש לקראת חתונת הבת",
    file_location: "",
    image_location: "../../assets/images/for-deleting/מסיני-בא-יעקב-שוואקי.jpeg",
    singerId: 2,
    count_like: 6,
    count_views: 18
  },{
    id: 16,
    name: "אנא", 
    title: "מאט דאב ואיציק דדיה בדואט: \"אנא\"",
    file_location: "",
    image_location: "../../assets/images/for-deleting/223388_tumb_750Xauto.jpg",
    singerId: 4,
    count_like: 9,
    count_views: 17
  },{
    id: 17,
    name: "נכספתי", 
    title: "איציק דדיה בסינגל חדש: \"נכספתי\"",
    file_location: "",
    image_location: "../../assets/images/for-deleting/211576_tumb_750Xauto.jpg",
    singerId: 4,
    count_like: 12,
    count_views: 23
  },{
    id: 18,
    name: "תן לי אור", 
    title: "\"תן לי אור\" - אבי אילסון בקליפ חדש",
    file_location: "",
    image_location: "../../assets/images/for-deleting/231862_tumb_750Xauto.jpg",
    singerId: 5,
    count_like: 4,
    count_views: 0
  },{
    id: 19,
    name: "מסיני בא", 
    title: "\"מסיני בא\" - יעקב שוואקי בסינגל חדש לקראת חתונת הבת",
    file_location: "",
    image_location: "../../assets/images/for-deleting/מסיני-בא-יעקב-שוואקי.jpeg",
    singerId: 2,
    count_like: 6,
    count_views: 1
  }];

  constructor() { }

  ngOnInit() {
  }

}
