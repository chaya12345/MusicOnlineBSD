import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialog, MatSnackBar } from '@angular/material';
import { element } from 'protractor';
import { Singer } from '../classes/singer';
import { MessageComponent } from '../message/message.component';
import { ArticleService } from '../services/article.service';
import { ArtistService } from '../services/artist.service';
import { CommonMessageService } from '../services/common-message.service';
import { PlaylistsService } from '../services/playlists.service';
import { SingerService } from '../services/singer.service';
import { SongService } from '../services/song.service';
import { TagService } from '../services/tag.service';

export class Item{
  id?:number;
  name?:string;
  type?:ItemType;
}
enum ItemType{SONG,ARTICLE,PLAYLIST,SINGER,ARTIST,TAG_FOR_SONG,TAG_FOR_ARTICLE}

@Component({
  selector: 'deleting-area',
  templateUrl: './deleting-area.component.html',
  styleUrls: ['./deleting-area.component.css','./../admin-style.css']
})
export class DeletingAreaComponent implements OnInit {

  itemList: Item[] = [];
  itemTypes: string[] = ["שיר", "כתבה", "פלייליסט", "זמר", "אומן", "תגית לשיר", "תגית לכתבה"];
  selectedType: string;
  selectedItem: number;
  type:FormControl;
  item:FormControl;

  constructor(private songService: SongService, private _snackBar: MatSnackBar, private cmService: CommonMessageService,
    private articleService: ArticleService, private playlistsService: PlaylistsService, private singerService: SingerService,
    private artistService: ArtistService, private tagService: TagService, public dialog: MatDialog) {
      this.item=new FormControl("",Validators.required);
      this.type=new FormControl("",Validators.required);
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
      this.songService.getSongs().subscribe(songs =>{
        songs.forEach(element=>{
          this.itemList.push(new Item,{id:element.id,name:element.name,type:ItemType.SONG})
        })
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }
  getArticles() {
    try {
      this.articleService.getArticles().subscribe(atricles =>{
        atricles.forEach(element=>{
          this.itemList.push(new Item,{id:element.id,name:element.title,type:ItemType.ARTICLE})
        })
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }
  getPlaylists() {
    try {
      this.playlistsService.getPlaylists().subscribe(playlists =>{
        playlists.forEach(element=>{
          this.itemList.push(new Item,{id:element.id,name:element.name,type:ItemType.SONG})
        })
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }
  getSingers() {
    try {
      this.singerService.getSingers().subscribe(singers => {
        singers.forEach(element=>{
          this.itemList.push(new Item,{id:element.id,name:element.name,type:ItemType.SINGER})
        })
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }
  getArtists() {
    try {
      this.artistService.getArtists().subscribe(artists => {
        artists.forEach(element=>{
          this.itemList.push(new Item,{id:element.id,name:element.name,type:ItemType.ARTIST})
        })
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }
  getTagsForSong() {
    try {
      this.tagService.getTagsForSongs().subscribe(tags => {
        tags.forEach(element=>{
          this.itemList.push(new Item,{id:element.id,name:element.name,type:ItemType.TAG_FOR_SONG})
        })
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }
  getTagsForArticle() {
    try {
      this.tagService.getTagsForArticles().subscribe(tags => {
        tags.forEach(element=>{
          this.itemList.push(new Item,{id:element.id,name:element.name,type:ItemType.TAG_FOR_ARTICLE})
        })
      }, err => console.log(err))
    } catch (err) { console.log(err); }
  }

  selectItemType(item: string) {
    this.selectedType = item;
    this.selectedItem = null;
    this.itemList=[];
    switch (item) {
      case "שיר": {
        this.getSongs();
        break;
      }
      case "כתבה": {
        this.getArticles();
        break;
      }
      case "פלייליסט": {
        this.getPlaylists();
        break;
      }
      case "זמר": {
        this.getSingers();
        break;
      }
      case "אומן": {
        this.getArtists();
        break;
      }
      case "תגית לשיר": {
        this.getTagsForArticle();
        break;
      }
      case "תגית לכתבה": {
        this.getTagsForSong();
        break;
      }
    }
  }

  selectItem(itemId: number) {
    this.selectedItem = itemId;
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
    if (this.selectedItem != null && this.selectedType != null&&this.item.valid==true&&this.type.valid==true) {
      switch (this.selectedType) {
        case "שיר": {
          this.deleteSong(this.selectedItem);
          break;
        }
        case "כתבה": {
          this.deleteArticle(this.selectedItem);
          break;
        }
        case "פלייליסט": {
          this.deletePlaylist(this.selectedItem);
          break;
        }
        case "זמר": {
          this.deleteSinger(this.selectedItem);
          break;
        }
        case "אומן": {
          this.deleteArtist(this.selectedItem);
          break;
        }
        case "תגית לשיר": {
          this.deleteTagForSong(this.selectedItem);
          break;
        }
        case "תגית לכתבה": {
          this.deleteTagForArticle(this.selectedItem);
          break;
        }
      }
      this.type.setValue("");
      this.item.setValue("");
    }
  }

}
