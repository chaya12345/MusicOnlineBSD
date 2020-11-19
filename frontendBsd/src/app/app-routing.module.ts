import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ArticleDetailsComponent } from './article-details/article-details.component';
import { ErrorPageComponent } from './error-page/error-page.component';
import { HomePageComponent } from './home-page/home-page.component';
import { MagazineComponent } from './magazine/magazine.component';
import { ParadeComponent } from './parade/parade.component';
import { PerformanceComponent } from './performance/performance.component';
import { PlaylistSectionComponent } from './playlist-section/playlist-section.component';
import { PlaylistsComponent } from './playlists/playlists.component';
import { PrivateAreaComponent } from './private-area/private-area.component';
import { SettingsComponent } from './settings/settings.component';
import { SongsComponent } from './songs/songs.component';


const routes: Routes = [{
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
  path: "parade",
  component: ParadeComponent
}, {
  path: "user",
  component: PrivateAreaComponent
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
