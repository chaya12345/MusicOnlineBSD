import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomePageComponent } from './home-page/home-page.component';
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
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
