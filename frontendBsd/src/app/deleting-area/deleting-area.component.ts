import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialog, MatSnackBar } from '@angular/material';
import { element } from 'protractor';
import { Article } from '../classes/article';
import { Artist } from '../classes/artist';
import { Playlists } from '../classes/playlists';
import { Singer } from '../classes/singer';
import { Song } from '../classes/song';
import { TagsForArticles, TagsForSongs } from '../classes/tag';
import { TagsToArticle } from '../classes/tagsToArticle';
import { TagsToSong } from '../classes/tagsToSong';
import { MessageComponent } from '../message/message.component';
import { ArticleService } from '../services/article.service';
import { ArtistService } from '../services/artist.service';
import { CommonMessageService } from '../services/common-message.service';
import { PlaylistsService } from '../services/playlists.service';
import { SingerService } from '../services/singer.service';
import { SongService } from '../services/song.service';
import { TagService } from '../services/tag.service';

export class Item {
  id?: number;
  name?: string;
  // type?: ItemType;
}
enum ItemType { SONG, ARTICLE, PLAYLIST, SINGER, ARTIST, TAG_FOR_SONG, TAG_FOR_ARTICLE }

@Component({
  selector: 'deleting-area',
  templateUrl: './deleting-area.component.html',
  styleUrls: ['./deleting-area.component.css', './../admin-style.css']
})
export class DeletingAreaComponent implements OnInit {

  itemList: Item[] = [];
  itemTypes: string[] = ["שיר", "כתבה", "פלייליסט", "זמר", "אומן", "תגית לשיר", "תגית לכתבה"];
  // selectedType: string;
  selectedType: ItemType;
  _selectedType: string;
  selectedItem: number;
  type: FormControl;
  item: FormControl;

  songs: Song[] = [];
  articles: Article[] = [];
  playlists: Playlists[] = [];
  singers: Singer[] = [];
  artists: Artist[] = [];
  tagsToS: TagsForSongs[] = [];
  tagsToA: TagsForArticles[] = [];

  _songs: Item[] = [];
  _articles: Item[] = [];
  _playlists: Item[] = [];
  _singers: Item[] = [];
  _artists: Item[] = [];
  _tagsToS: Item[] = [];
  _tagsToA: Item[] = [];

  loading: boolean = false;

  constructor(private songService: SongService, private _snackBar: MatSnackBar, private cmService: CommonMessageService,
    private articleService: ArticleService, private playlistsService: PlaylistsService, private singerService: SingerService,
    private artistService: ArtistService, private tagService: TagService, public dialog: MatDialog) {
    this.item = new FormControl("", Validators.required);
    this.type = new FormControl("", Validators.required);
    // this.getSongs();
    // this.getArticles();
    // this.getPlaylists();
    // this.getSingers();
    // this.getArtists();
    // this.getTagsForSong();
    // this.getTagsForArticle();
  }

  ngOnInit(): void {
  }

  deleteSong(songId: number) {
    try {
      this.songService.deleteSong(songId).subscribe(suc => this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  deleteArticle(articleId: number) {
    try {
      this.articleService.deleteArticle(articleId).subscribe(suc => this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  deletePlaylist(playlistId: number) {
    try {
      this.playlistsService.deletePlayList(playlistId).subscribe(suc => this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  deleteSinger(singerId: number) {
    try {
      this.singerService.deleteSinger(singerId).subscribe(suc => this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  deleteArtist(artistId: number) {
    try {
      this.artistService.DeleteArtist(artistId).subscribe(suc => this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  deleteTagForSong(tagForSongId: number) {
    try {
      this.tagService.deleteTagForSong(tagForSongId).subscribe(suc => this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  deleteTagForArticle(tagForArticleId: number) {
    try {
      this.tagService.deleteTagForArticle(tagForArticleId).subscribe(suc => this.openSnackBar(this.cmService.DELETE_ITEM.SUCCESS),
        err => this.openSnackBar(this.cmService.DELETE_ITEM.ERROR));
    } catch (err) { console.log(err); }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, '', {
      duration: 2000,
    });
  }

  getSongs() {
    try {
      this.songService.getSongs().subscribe(songs => {
        // songs.forEach(element => {
        //   let item = new Item();
        //   item.id = element.id;
        //   item.name = element.name;
        //   this.itemList.push(item); //, type: ItemType.SONG
        // });
        this.songs = songs;
        this.convertToItem(ItemType.SONG);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getArticles() {
    try {
      this.articleService.getArticles().subscribe(articles => {
        // atricles.forEach(element => {
        //   let item = new Item();
        //   item.id = element.id;
        //   item.name = element.title;
        //   this.itemList.push(item); //, type: ItemType.ARTICLE
        // });
        this.articles = articles;
        this.convertToItem(ItemType.ARTICLE);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getPlaylists() {
    try {
      this.playlistsService.getPlaylists().subscribe(playlists => {
        // playlists.forEach(element => {
        //   let item = new Item();
        //   item.id = element.id;
        //   item.name = element.name;
        //   this.itemList.push(item); //, type: ItemType.SONG
        // });
        this.playlists = playlists;
        this.convertToItem(ItemType.PLAYLIST);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getSingers() {
    try {
      this.singerService.getSingers().subscribe(singers => {
        // singers.forEach(element => {
        //   let item = new Item();
        //   item.id = element.id;
        //   item.name = element.name;
        //   this.itemList.push(item); //, type: ItemType.SINGER
        // });
        this.singers = singers;
        this.convertToItem(ItemType.SINGER);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getArtists() {
    try {
      this.artistService.getArtists().subscribe(artists => {
        // artists.forEach(element => {
        //   let item = new Item();
        //   item.id = element.id;
        //   item.name = element.name;
        //   this.itemList.push(item); //, type: ItemType.ARTIST
        // });
        this.artists = artists;
        this.convertToItem(ItemType.ARTIST);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getTagsForSong() {
    try {
      this.tagService.getTagsForSongs().subscribe(tags => {
        // tags.forEach(element => {
        //   let item = new Item();
        //   item.id = element.id;
        //   item.name = element.name;
        //   this.itemList.push(item); //, type: ItemType.TAG_FOR_SONG
        // });
        this.tagsToS = tags;
        this.convertToItem(ItemType.TAG_FOR_SONG);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  getTagsForArticle() {
    try {
      this.tagService.getTagsForArticles().subscribe(tags => {
        // tags.forEach(element => {
        //   let item = new Item();
        //   item.id = element.id;
        //   item.name = element.name;
        //   this.itemList.push(item); //, type: ItemType.TAG_FOR_ARTICLE
        // });
        this.tagsToA = tags;
        this.convertToItem(ItemType.TAG_FOR_ARTICLE);
      }, err => console.log(err));
    } catch (err) { console.log(err); }
  }

  selectItemType(item: string) {
    if (this.selectedType == this.itemTypes.indexOf(item))
      return;
    this.loading = true;
    this.selectedType = this.itemTypes.indexOf(item);
    this.itemList = [];
    switch (this.selectedType) {
      case ItemType.SONG:
        if (this.songs.length > 0) {
          this.itemList = this._songs;
          this.loading = false;
        }
        else {
          this.getSongs();
        }
        break;
      case ItemType.ARTICLE:
        if (this._articles.length > 0) {
          this.itemList = this._articles;
          this.loading = false;
        }
        else {
          // this.convertToItem(ItemType.ARTICLE);
          this.getArticles();
        }
        break;
      case ItemType.PLAYLIST:
        if (this._playlists.length > 0) {
          this.itemList = this._playlists;
          this.loading = false;
        }
        else {
          // this.convertToItem(ItemType.PLAYLIST);
          this.getPlaylists();
        }
        break;
      case ItemType.SINGER:
        if (this._singers.length > 0) {
          this.itemList = this._singers;
          this.loading = false;
        }
        else {
          // this.convertToItem(ItemType.SINGER);
          this.getSingers();
        }
        break;
      case ItemType.ARTIST:
        if (this._artists.length > 0) {
          this.itemList = this._artists;
          this.loading = false;
        }
        else {
          // this.convertToItem(ItemType.ARTIST);
          this.getArtists();
        }
        break;
      case ItemType.TAG_FOR_ARTICLE:
        if (this._tagsToA.length > 0) {
          this.itemList = this._tagsToA;
          this.loading = false;
        }
        else {
          // this.convertToItem(ItemType.TAG_FOR_ARTICLE);
          this.getTagsForArticle();
        }
        break;
      case ItemType.TAG_FOR_SONG:
        if (this._tagsToS.length > 0) {
          this.itemList = this._tagsToS;
          this.loading = false;
        }
        else {
          // this.convertToItem(ItemType.TAG_FOR_SONG);
          this.getTagsForSong();
        }
        break;
    }
    // this.selectedType = item;
    // this.selectedItem = null;
    // this.itemList = [];
    // switch (item) {
    //   case "שיר": {
    //     this.getSongs();
    //     break;
    //   }
    //   case "כתבה": {
    //     this.getArticles();
    //     break;
    //   }
    //   case "פלייליסט": {
    //     this.getPlaylists();
    //     break;
    //   }
    //   case "זמר": {
    //     this.getSingers();
    //     break;
    //   }
    //   case "אומן": {
    //     this.getArtists();
    //     break;
    //   }
    //   case "תגית לשיר": {
    //     this.getTagsForArticle();
    //     break;
    //   }
    //   case "תגית לכתבה": {
    //     this.getTagsForSong();
    //     break;
    //   }
    // }
  }

  convertToItem(type: ItemType): void {
    switch (type) {
      case ItemType.SONG:
        this.songs.forEach(element => {
          let item = new Item();
          item.id = element.id;
          item.name = element.name;
          this._songs.push(item);
        });
        this.itemList = this._songs;
        break;
      case ItemType.ARTICLE:
        this.articles.forEach(element => {
          let item = new Item();
          item.id = element.id;
          item.name = element.title;
          this._articles.push(item);
        });
        this.itemList = this._articles;
        break;
      case ItemType.PLAYLIST:
        this.playlists.forEach(element => {
          let item = new Item();
          item.id = element.id;
          item.name = element.name;
          this._playlists.push(item);
        });
        this.itemList = this._playlists;
        break;
      case ItemType.SINGER:
        this.singers.forEach(element => {
          let item = new Item();
          item.id = element.id;
          item.name = element.name;
          this._singers.push(item);
        });
        this.itemList = this._singers;
        break;
      case ItemType.ARTIST:
        this.artists.forEach(element => {
          let item = new Item();
          item.id = element.id;
          item.name = element.name;
          this._artists.push(item);
        });
        this.itemList = this._artists;
        break;
      case ItemType.TAG_FOR_SONG:
        this.tagsToS.forEach(element => {
          let item = new Item();
          item.id = element.id;
          item.name = element.name;
          this._tagsToS.push(item);
        });
        this.itemList = this._tagsToS;
        break;
      case ItemType.TAG_FOR_ARTICLE:
        this.tagsToA.forEach(element => {
          let item = new Item();
          item.id = element.id;
          item.name = element.name;
          this._tagsToA.push(item);
        });
        this.itemList = this._tagsToA;
        break;
    }
    this.loading = false;
  }

  selectItem(itemId/*: number*/) {
    // this.selectedItem = itemId;
  }

  openMessageDialog(text: string) {
    try {
      const dialogRef = this.dialog.open(MessageComponent, {
        width: '400px',
        data: { dialogText: text }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result == true)
          this.deleteItem();
      });
    } catch (err) { console.log(err); }
  }

  deleteItem() {
    if (this.selectedItem != null && this.selectedType != null && this.item.valid == true && this.type.valid == true) {
      // switch (this.selectedType) {
      //   case "שיר": {
      //     this.deleteSong(this.selectedItem);
      //     break;
      //   }
      //   case "כתבה": {
      //     this.deleteArticle(this.selectedItem);
      //     break;
      //   }
      //   case "פלייליסט": {
      //     this.deletePlaylist(this.selectedItem);
      //     break;
      //   }
      //   case "זמר": {
      //     this.deleteSinger(this.selectedItem);
      //     break;
      //   }
      //   case "אומן": {
      //     this.deleteArtist(this.selectedItem);
      //     break;
      //   }
      //   case "תגית לשיר": {
      //     this.deleteTagForSong(this.selectedItem);
      //     break;
      //   }
      //   case "תגית לכתבה": {
      //     this.deleteTagForArticle(this.selectedItem);
      //     break;
      //   }
      // }
      this.type.setValue("");
      this.item.setValue("");
    }
  }

}
