import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ArticleDetailsComponent } from './article-details/article-details.component';
import { ErrorPageComponent } from './error-page/error-page.component';
import { HomePageComponent } from './home-page/home-page.component';
import { SongsBySingerComponent } from './songs-by-singer/songs-by-singer.component';
import { SongsPageComponent } from './songs-page/songs-page.component';


const routes: Routes = [{
  path: "",
  component: HomePageComponent
}, {
  path: "home",
  component: HomePageComponent
}, {
  path: "song",
  component: SongsPageComponent
}, {
  path: "song/:id",
  component: SongsPageComponent
}, {
  path: "songs/:singerName",
  component: SongsBySingerComponent
}, {
  path: "article/:id",
  component: ArticleDetailsComponent
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
