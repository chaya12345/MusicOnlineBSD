import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Song } from '../classes/song';
import { SongService } from '../services/song.service';
import { Singer } from '../classes/singer';
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

  filteredArtists: Observable<ArtistsAndSingers[]>;
  artistsControl = new FormControl();
  artistsIncludeSingers: ArtistsAndSingers[] = [];

  filteredTags: Observable<Tag[]>;
  tagsControl = new FormControl();
  tags: Tag[] = [];
  tagsList: Tag[] = [];

  constructor(private songService: SongService,
    private tagService: TagService, private artistsAndSingersService: ArtistsAndSingersService) {
    this.songsControl = new FormControl();
    this.artistsControl = new FormControl();
    this.tagsControl = new FormControl();
    try {
      this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.updateSongsList(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
    try {
      this.tagService.getTags().subscribe(tags => { this.tags = tags; this.filter(); this.updateTagsList(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
    try {
      this.artistsAndSingersService.getArtistsAndSingers().subscribe(artist => { this.artistsIncludeSingers = artist; this.filter(); this.updateArtistsList(); }, err => { console.log(err); });
    }
    catch (err) { console.log(err); }
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

  public updateArtistsList(): void {
    this.filteredArtists = this.artistsControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filterArtists(value))
      );
  }

  public _filterArtists(value: string): ArtistsAndSingers[] {
    const filterValue = value.toLowerCase();
    return this.artistsIncludeSingers.filter(artist => artist.name.toLowerCase().includes(filterValue));
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
