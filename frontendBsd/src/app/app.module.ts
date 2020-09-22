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
import { LatestArticleComponent } from './latest-article/latest-article.component';
import { FooterSongComponent } from './footer-song/footer-song.component';
import { PopularPlaylistComponent } from './popular-playlist/popular-playlist.component';
import { NowViewedComponent } from './now-viewed/now-viewed.component';
import { LatestCommitsComponent } from './latest-commits/latest-commits.component';
import { InfoFooterComponent } from './info-footer/info-footer.component';
import { CopyrightsComponent } from './copyrights/copyrights.component';
import { ScrollTopComponent } from './scroll-top/scroll-top.component';
import { SideNavComponent } from './side-nav/side-nav.component';
import { SongsPageComponent } from './songs-page/songs-page.component';
import { SongDetailsComponent } from './song-details/song-details.component';
import { TopComponent } from './top/top.component';
import { MainComponent } from './main/main.component';
import { SideComponent } from './side/side.component';
import { InfoComponent } from './info/info.component';
import { TagsComponent } from './tags/tags.component';
import { ResponsesComponent } from './responses/responses.component';
import { ResponsesSongComponent } from './responses-song/responses-song.component';
import { ResponsesArticleComponent } from './responses-article/responses-article.component';
import { AddingResponseComponent } from './adding-response/adding-response.component';
import { ResponseComponent } from './response/response.component';
import { ReportingComponent } from './reporting/reporting.component';
import { SongComponent } from './song/song.component';

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
    LatestArticleComponent,
    FooterSongComponent,
    PopularPlaylistComponent,
    NowViewedComponent,
    LatestCommitsComponent,
    InfoFooterComponent,
    CopyrightsComponent,
    ScrollTopComponent,
    SideNavComponent,
    SongsPageComponent,
    SongDetailsComponent,
    TopComponent,
    MainComponent,
    SideComponent,
    InfoComponent,
    TagsComponent,
    ResponsesComponent,
    ResponsesSongComponent,
    ResponsesArticleComponent,
    AddingResponseComponent,
    ResponseComponent,
    ReportingComponent,
    SongComponent
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
