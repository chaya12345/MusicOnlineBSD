import { Component, NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AnnualSurveyComponent } from './annual-survey/annual-survey.component';
import { ArticleDetailsComponent } from './article-details/article-details.component';
import { ArticleComponent } from './article/article.component';
import { ErrorPageComponent } from './error-page/error-page.component';
import { HomePageComponent } from './home-page/home-page.component';
import { MagazineComponent } from './magazine/magazine.component';
import { ParadeComponent } from './parade/parade.component';
import { PerformanceComponent } from './performance/performance.component';
import { PlaylistSectionComponent } from './playlist-section/playlist-section.component';
import { PlaylistsComponent } from './playlists/playlists.component';
import { ResponsesArticleComponent } from './responses-article/responses-article.component';
import { ResponsesSongComponent } from './responses-song/responses-song.component';
import { SettingsComponent } from './settings/settings.component';
import { SongsBySingerComponent } from './songs-by-singer/songs-by-singer.component';
import { SongsPageComponent } from './songs-page/songs-page.component';
import { SongsComponent } from './songs/songs.component';


const routes: Routes = [{
  //   path: "",
  //   component: HomePageComponent
  // }, {
  //   path: "home",
  //   component: HomePageComponent
  // }, {
  //   path: "song",
  //   component: SongsComponent
  // }, {
  //   path: "song/:id",
  //   component: SongsComponent
  // }, {
  //   path: "song/:id/commit/:commitId",
  //   component: SongsComponent
  // },
  // {
  //   path: "song/:filter/:value",
  //   component: SongsComponent
  // }, {
  //   path:" song/:filter/:value/order/:orderType",
  //   component: SongsComponent
  // },
  //  {
  //   path: "magazine",
  //   component: MagazineComponent
  // }, {
  //   path: "article/:id",
  //   component: ArticleDetailsComponent
  // },
  // {
  //   path: "article/:id/commit/:commitId",
  //   component: ArticleDetailsComponent
  // }, {
  //   path: "playlists",
  //   component: PlaylistsComponent
  // }, {
  //   path: "playlist/:id",
  //   component: PlaylistSectionComponent
  // }, {
  //   path: "error",
  //   component: ErrorPageComponent
  // }, {
  //   path: "**",
  //   component: ErrorPageComponent

  path: "",
  component: HomePageComponent
}, {
  path: "home",
  component: HomePageComponent
}, {
  path: "song",
  component: SongsComponent
}, {
  path: "magazine",
  component: MagazineComponent
}, {
  path: "magazine/article",
  component: ArticleDetailsComponent
}, {
  path: "playlists",
  component: PlaylistsComponent
}, {
  path: "playlist",
  component: PlaylistSectionComponent
}, {
  path: "settings",
  component: SettingsComponent
}, {
  path: "performance",
  component: PerformanceComponent
}, {
  path: "annual-survey",
  component: AnnualSurveyComponent
}, {
  path: "parade",
  component: ParadeComponent
}, {
  path: "error",
  component: ErrorPageComponent
}, {
  path: "**",
  component: ErrorPageComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes, { enableTracing: true })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
