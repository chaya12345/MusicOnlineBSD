import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ArticleDetailsComponent } from './article-details/article-details.component';
import { ErrorPageComponent } from './error-page/error-page.component';
import { HomePageComponent } from './home-page/home-page.component';
import { MagazineComponent } from './magazine/magazine.component';
import { PlaylistSectionComponent } from './playlist-section/playlist-section.component';
import { PlaylistsComponent } from './playlists/playlists.component';
import { SongsBySingerComponent } from './songs-by-singer/songs-by-singer.component';
import { SongsPageComponent } from './songs-page/songs-page.component';
import { SongsComponent } from './songs/songs.component';


const routes: Routes = [{
  path: "",
  component: HomePageComponent
}, {
  path: "home",
  component: HomePageComponent
},/* {
  path: "song",
  component: SongsPageComponent
}, {
  path: "song/:id",
  component: SongsPageComponent
}, {
  path: "songs/:filter/:value",
  component: SongsBySingerComponent
},*/ {
  path: "song",
  component: SongsComponent
}, {
  path: "song/:id",
  component: SongsComponent
}, {
  path: "song/:filter/:value",
  component: SongsComponent
}, {
  path: "song/:filter/:value/:order/:dir",
  component: SongsComponent
}, {
  path: "magazine",
  component: MagazineComponent
}, {
  path: "article/:id",
  component: ArticleDetailsComponent
}, {
  path: "playlists",
  component: PlaylistsComponent
}, {
  path: "playlist/:id",
  component: PlaylistSectionComponent
}, {
  path: "error",
  component: ErrorPageComponent
}, {
  path: "**",
  component: ErrorPageComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
