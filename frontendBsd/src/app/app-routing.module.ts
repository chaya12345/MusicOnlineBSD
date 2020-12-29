import { NgModule } from '@angular/core';
import { Routes, RouterModule, CanActivate } from '@angular/router';
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
import { 
  AuthGuardService as AuthGuard 
} from './services/auth-guard.service';
import { AdminComponent } from './admin/admin.component';
import { MainPageComponent } from './main-page/main-page.component';
import { UserAreaComponent } from './user-area/user-area.component';
import { SearchingAreaComponent } from './searching-area/searching-area.component';
import { ContentManagementComponent } from './content-management/content-management.component';
import { SiteStatusComponent } from './site-status/site-status.component';


const routes: Routes = [{
  path: "",
  component: MainPageComponent // HomePageComponent
}, {
  path: "home",
  component: MainPageComponent // HomePageComponent
}, {
  path: "main",
  component: MainPageComponent
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
  path: "searching",
  component: SearchingAreaComponent
}, {
  path: "settings",
  component: SettingsComponent,
  // canActivate: [AuthGuard],
  data: { 
    expectedRole: 'admin'
  }
}, {
  path: "performance",
  component: PerformanceComponent
}, {
  path: "parade",
  component: ParadeComponent
}, {
  path: "user-area",
  component: UserAreaComponent
}, {
  path: "user",
  component: PrivateAreaComponent,
  // canActivate: [AuthGuard]
  // prevent activate but not to navigate to..
  // to do that use in - canLoad instead of canActivate
}, {
  path: "admin",
  component: AdminComponent,
  children: [{
    path: "",
    component: ContentManagementComponent
  }, {
    path: "content-management",
    component: ContentManagementComponent
  }, {
    path: "site-status",
    component: SiteStatusComponent
  }]
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
