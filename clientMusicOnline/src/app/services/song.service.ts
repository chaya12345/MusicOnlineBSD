import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SongService {

  toggle_like(event): void {
    if (event.target.innerHTML == "favorite_border")
      event.target.innerHTML = "favorite";
    else if (event.target.innerHTML == "favorite")
      event.target.innerHTML = "favorite_border";
  }

  change_like_color(event): void {
    event.target.style.color = "#F44336";
  }

  reset_like_color(event, color: string): void {
    event.target.style.color = color != null ? color : "white";
  }

  constructor() { }
}
