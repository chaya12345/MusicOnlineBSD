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
import { UploadingSongComponent } from './uploading-song/uploading-song.component';
import { UploadingArticleComponent } from './uploading-article/uploading-article.component';
import { AddingPlaylistComponent } from './adding-playlist/adding-playlist.component';
import { CommitsBoardComponent } from './commits-board/commits-board.component';
import { ReportsBoardComponent } from './reports-board/reports-board.component';
import { ActivationParadeComponent } from './activation-parade/activation-parade.component';
import { DeletingAreaComponent } from './deleting-area/deleting-area.component';
import { ManageSongComponent } from './manage-song/manage-song.component';


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
    component: SiteStatusComponent
  }, {
    path: "content-management",
    component: ContentManagementComponent, 
    children: [{
      path: "Song",
      component: ManageSongComponent
    }, {
      path: "Article",
      component: UploadingArticleComponent
    }, {
      path: "Playlist",
      component: AddingPlaylistComponent
    }, {
      path: "Parade",
      component: ActivationParadeComponent
    }, {
      path: "songs",
      component: UploadingSongComponent
    }, {
      path: "articles",
      component: UploadingArticleComponent
    }, {
      path: "playlists",
      component: AddingPlaylistComponent
    }, {
      path: "parade",
      component: ActivationParadeComponent
    }, {
      path: "commits",
      component: CommitsBoardComponent
    }, {
      path: "deleting-area",
      component: DeletingAreaComponent
    }, {
      path: "reports-area",
      component: ReportsBoardComponent
    }]
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
