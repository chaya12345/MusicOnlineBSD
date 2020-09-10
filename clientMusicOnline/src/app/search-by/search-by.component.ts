import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { SingerService } from '../services/singer.service';
import { Singer } from '../classes/singer';
import { ArtistService } from '../services/artist.service';
import { Artist } from '../classes/artist';
import { TagService } from '../services/tag.service';
import { Tag } from '../classes/tag';

@Component({
  selector: 'search-by',
  templateUrl: './search-by.component.html',
  styleUrls: ['./search-by.component.css']
})
export class SearchByComponent implements OnInit {

  singers = new FormControl();
  tags = new FormControl();
  artists = new FormControl();
  singersList: Singer[] = [];
  artistsList: Artist[] = [];
  tagsList: Tag[] = [];

  constructor(private singerService: SingerService, private artistService: ArtistService, private tagService: TagService) {
    try {
      this.singerService.getSingers().subscribe(singer => { this.singersList = singer; }, err => { console.log(err); });
    }
    catch { console.log('search-by'); }
    try {
      this.artistService.getArtists().subscribe(artist => { this.artistsList = artist; }, err => { console.log(err); });
    }
    catch { console.log('search-by'); }
    try {
      this.tagService.getTags().subscribe(tag => { this.tagsList = tag; }, err => { console.log(err); });
    }
    catch { console.log('search-by'); }
  }

  ngOnInit() {
  }

}
