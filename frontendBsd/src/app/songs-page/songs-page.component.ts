import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Song } from '../classes/song';
import { ShareDataService } from '../services/share-data.service';
import { SongService } from '../services/song.service';

declare var angular: any;
// var app = angular.module('myapp', ['ngRoute']);

@Component({
  selector: 'songs-page',
  templateUrl: './songs-page.component.html',
  styleUrls: ['./songs-page.component.css']
})
export class SongsPageComponent implements OnInit {

  isNarrow: boolean = false;
  songId: number = null;
  song: Song;
  songsList: Song[] = [];

  constructor(private shareData: ShareDataService, private activatedRoute: ActivatedRoute,
    private songService: SongService, private router: Router) {
    try {
      this.songService.getSongs().subscribe(songs => { this.songsList = songs; this.orderByDate(); }, err => console.log(err));
    }
    catch { console.log("all songs in songs-page") }
  }

  ngOnInit() {
    this.shareData.childEventListner().subscribe(isNavOpened => {
      this.isNarrow = isNavOpened;
    });
    this.activatedRoute.params.subscribe(params => {
      this.initialiseState();
    });
  }

  initialiseState(): void {
    if (this.activatedRoute.snapshot.paramMap.get('id') != null) {
      this.songId = parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
      this.getSongById();
    }
    else this.songId = null;
    this.song = null;
  }

  getSongById(): void {
    try {
      this.songService.getSongById(this.songId).subscribe(song => { this.song = song; this.checkIsFound(); }, err => { console.log(err); });
    }
    catch { console.log('song-details'); }
  }

  checkIsFound(): void {
    if (this.song == null) {
      console.log("the song disappeared");
      this.router.navigateByUrl('/error');
    }
  }

  orderByDate(): void {
    this.songsList.sort((a, b) => Math.round(new Date(b.date).getTime() - new Date(a.date).getTime()));
    this.reloadMore()
  }

  reloadMore(): void {
    try {
      angular.module('myapp', ['ngRoute']).controller('ctrl1', function ($scope) {

        // set up the list with dummy data
        $scope.offres = [];
        for (var i = 0; i < 11; i++) {
          $scope.offres.push(i + 1);
        }

        for (var i = 0; i < this.songsList.length; i++) {
          $scope.offres.push(i + 1);
        }
        console.log("length: " + this.songsList.length);
        // this.songsList.forEach(song => {
        //   $scope.offres.push(song);
        // });

        // set initial index
        // we will use this variable to control the display - see ng-show="" in HTML
        $scope.loadIndex = 2;

        // function to increase visible items
        $scope.showMore = function () {
          // don't increment if at the end of the list
          if ($scope.loadIndex < $scope.offres.length) {
            $scope.loadIndex += 2;
          }
        };

        // function to decrease visible items
        $scope.showLess = function () {
          // don't decrement if at the start of the list
          if ($scope.loadIndex > 2) {
            $scope.loadIndex -= 2;
          }
        };
      });
    }
    catch { console.log("load more failed"); }
  }

}
