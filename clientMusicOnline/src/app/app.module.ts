import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { MaterialModule } from './material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HeaderComponent } from './header/header.component';
import { NavComponent } from './nav/nav.component';
import { NewsicComponent } from './newsic/newsic.component';
import { MusicChannelsComponent } from './music-channels/music-channels.component';
import { FooterComponent } from './footer/footer.component';
import { InfoComponent } from './info/info.component';
import { MagazineComponent } from './magazine/magazine.component';
import { ClipsComponent } from './clips/clips.component';
import { SearchingComponent } from './searching/searching.component';
import { MainActionsComponent } from './main-actions/main-actions.component';
import { popularlyComponent } from './popularly/popularly.component';
import { ContentComponent } from './content/content.component';
import { SideComponent } from './side/side.component';
import { MainComponent } from './main/main.component';
import { FavoriteComponent } from './favorite/favorite.component';
import { ViewedComponent } from './viewed/viewed.component';
import { PopularSingersComponent } from './popular-singers/popular-singers.component';
import { AboutComponent } from './about/about.component';
import { RecentCommentsComponent } from './recent-comments/recent-comments.component';
import { NowViewedComponent } from './now-viewed/now-viewed.component';
import { CopyrightComponent } from './copyright/copyright.component';
import { MiniSearchingComponent } from './mini-searching/mini-searching.component';
import { RegistrationComponent } from './registration/registration.component';
import { SongComponent } from './song/song.component';
import { FooterSongComponent } from './footer-song/footer-song.component';
import { TopComponent } from './top/top.component';
import { SideNavComponent } from './side-nav/side-nav.component';
import { SearchSpesificSongComponent } from './search-spesific-song/search-spesific-song.component';
import { SearchByComponent } from './search-by/search-by.component';
import { ForTryComponent } from './for-try/for-try.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    NavComponent,
    NewsicComponent,
    MusicChannelsComponent,
    FooterComponent,
    InfoComponent,
    MagazineComponent,
    ClipsComponent,
    SearchingComponent,
    MainActionsComponent,
    popularlyComponent,
    ContentComponent,
    SideComponent,
    MainComponent,
    FavoriteComponent,
    ViewedComponent,
    PopularSingersComponent,
    AboutComponent,
    RecentCommentsComponent,
    NowViewedComponent,
    CopyrightComponent,
    MiniSearchingComponent,
    RegistrationComponent,
    SongComponent,
    FooterSongComponent,
    TopComponent,
    SideNavComponent,
    SearchSpesificSongComponent,
    SearchByComponent,
    ForTryComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
