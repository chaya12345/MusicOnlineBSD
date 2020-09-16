import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { MaterialModule } from './material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { ContentComponent } from './content/content.component';
import { FooterComponent } from './footer/footer.component';
import { NewSongsComponent } from './new-songs/new-songs.component';
import { RegisterComponent } from './register/register.component';
import { ClipsComponent } from './clips/clips.component';
import { LatestClipsComponent } from './latest-clips/latest-clips.component';
import { LatestInMagazineComponent } from './latest-in-magazine/latest-in-magazine.component';
import { PopularPlaylistsComponent } from './popular-playlists/popular-playlists.component';
import { SearchComponent } from './search/search.component';
import { LatestNewsComponent } from './latest-news/latest-news.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HomePageComponent } from './home-page/home-page.component';
import { RegisterToWebsiteComponent } from './register-to-website/register-to-website.component';
import { RegisterToNewsletterComponent } from './register-to-newsletter/register-to-newsletter.component';
import { LatestClipComponent } from './latest-clip/latest-clip.component';
import { LatestArticleComponent } from './latest-article/latest-article.component';
import { FooterSongComponent } from './footer-song/footer-song.component';
import { PopularPlaylistComponent } from './popular-playlist/popular-playlist.component';
import { NowViewedComponent } from './now-viewed/now-viewed.component';
import { LatestCommitsComponent } from './latest-commits/latest-commits.component';
import { InfoFooterComponent } from './info-footer/info-footer.component';
import { CopyrightsComponent } from './copyrights/copyrights.component';
import { ScrollTopComponent } from './scroll-top/scroll-top.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    ContentComponent,
    FooterComponent,
    NewSongsComponent,
    RegisterComponent,
    ClipsComponent,
    LatestClipsComponent,
    LatestInMagazineComponent,
    PopularPlaylistsComponent,
    SearchComponent,
    LatestNewsComponent,
    HomePageComponent,
    RegisterToWebsiteComponent,
    RegisterToNewsletterComponent,
    LatestClipComponent,
    LatestArticleComponent,
    FooterSongComponent,
    PopularPlaylistComponent,
    NowViewedComponent,
    LatestCommitsComponent,
    InfoFooterComponent,
    CopyrightsComponent,
    ScrollTopComponent
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
  bootstrap: [AppComponent],
  entryComponents: [
    RegisterToWebsiteComponent,
    RegisterToNewsletterComponent
  ]
})
export class AppModule { }
