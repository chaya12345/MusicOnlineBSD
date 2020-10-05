import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { ArtistService } from '../services/artist.service';
import { Singer } from '../classes/singer';
import { SingerService } from '../services/singer.service';
import { Artist } from '../classes/artist';
import { TagService } from '../services/tag.service';
import { Tag } from '../classes/tag';
import { ArtistsAndSingersService } from '../services/artists-and-singers.service';
import { ArtistsAndSingers } from '../classes/artistsAndSingers';

@Component({
  selector: 'search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  filteredSongs: Observable<Song[]>;
  songsList: Song[] = [];
  songsControl = new FormControl();

  filteredSingers: Observable<Singer[]>;
  singersControl = new FormControl();
  singersList: Singer[] = [];
  artistsList: Artist[] = [];
  artistsIncludeSingers: ArtistsAndSingers[] = [];

  filteredTags: Observable<Tag[]>;
  tagsControl = new FormControl();
  tags: Tag[] = [];
  tagsList: Tag[] = [];

  constructor(private songService: SongService, private singerService: SingerService, private artistService: ArtistService,
    private tagService: TagService, private artistsAndSingersService: ArtistsAndSingersService) {
    this.songsControl = new FormControl();
    this.singersControl = new FormControl();
    this.tagsControl = new FormControl();
    try {
      this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.updateSongsList(); }, err => { console.log(err); });
    }
    catch { console.log('search-spesific'); }
    try {
      this.singerService.getSingers().subscribe(singers => { this.singersList = singers; this.updateSingersList(); }, err => { console.log(err); });
    }
    catch { console.log('mini-searching'); }
    try {
      this.artistService.getArtists().subscribe(artists => { this.artistsList = artists; this.updateArtistsList(); }, err => { console.log(err); });
    }
    catch { console.log('mini-searching'); }
    try {
      this.tagService.getTags().subscribe(tags => { this.tags = tags; this.filter(); this.updateTagsList(); }, err => { console.log(err); });
    }
    catch { console.log('mini-searching'); }
    try {
      this.artistsAndSingersService.getArtistsAndSingers().subscribe(artist => { this.artistsIncludeSingers = artist; this.filter(); this.updateTagsList(); }, err => { console.log(err); });
    }
    catch { console.log('mini-searching'); }
  }

  ngOnInit(): void {
  }

  public updateSongsList(): void {
    this.filteredSongs = this.songsControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSongs(value))
      );
  }

  public _filterSongs(value: string): Song[] {
    const filterValue = value.toLowerCase();
    return this.songsList.filter(song => song.name.toLowerCase().includes(filterValue));
  }

  public updateSingersList(): void {
    this.filteredSingers = this.singersControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterSingers(value))
      );
  }

  public _filterSingers(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.singersList.filter(singer => singer.name.toLowerCase().includes(filterValue));
  }

  public updateArtistsList(): void {
    this.filteredSingers = this.singersControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterArtists(value))
      );
  }

  public _filterArtists(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.artistsList.filter(artist => artist.name.toLowerCase().includes(filterValue));
  }

  public updateTagsList(): void {
    this.filteredTags = this.tagsControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterTags(value))
      );
  }

  public _filterTags(value: string): Singer[] {
    const filterValue = value.toLowerCase();
    return this.tagsList.filter(tag => tag.name.toLowerCase().includes(filterValue));
  }

  public filter(): void {
    this.tags.forEach(tag => {
      if (tag.isShow == true)
        this.tagsList.push(tag);
    });
  }

}
