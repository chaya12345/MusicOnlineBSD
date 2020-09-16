import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LikeService {

  toggle_like(event): void {
    if (event.target.innerHTML == "favorite_border")
      event.target.innerHTML = "favorite";
    else if (event.target.innerHTML == "favorite")
      event.target.innerHTML = "favorite_border";
  }

  change_like_color(event,color:string): void {
    event.target.style.color =color!=null?color:"white" ;
  }

  reset_like_color(event, color: string): void {
    event.target.style.color = color != null ? color :"#F44336" ;
  }

  constructor() { }
}
