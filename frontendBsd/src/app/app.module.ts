import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { MaterialModule } from './material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { MatVideoModule } from 'mat-video';

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
import { LatestCommitsComponent } from './latest-commits/latest-commits.component';
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
import { ResponseComponent } from './response/response.component';
import { ReportingComponent } from './reporting/reporting.component';
import { SongComponent } from './song/song.component';
import { SmallSongComponent } from './small-song/small-song.component';
import { ReportingDialogComponent } from './reporting-dialog/reporting-dialog.component';
import { ErrorPageComponent } from './error-page/error-page.component';
import { ResponseAddingComponent } from './response-adding/response-adding.component';
import { CurrentNavComponent } from './current-nav/current-nav.component';
import { AllSongsComponent } from './all-songs/all-songs.component';
import { SongsListComponent } from './songs-list/songs-list.component';
import { SongsBySingerComponent } from './songs-by-singer/songs-by-singer.component';
import { ToolsComponent } from './tools/tools.component';
import { ArticleDetailsComponent } from './article-details/article-details.component';
import { MagazineComponent } from './magazine/magazine.component';
import { TextComponent } from './text/text.component';
import { VideoSectionComponent } from './video-section/video-section.component';
import { AllArticlesComponent } from './all-articles/all-articles.component';
import { ArticleComponent } from './article/article.component';
import { RatingComponent } from './rating/rating.component';
import { PlaylistsComponent } from './playlists/playlists.component';
import { PlaylistSectionComponent } from './playlist-section/playlist-section.component';
import { SongsInPlaylistComponent } from './songs-in-playlist/songs-in-playlist.component';
import { SongInPlaylistComponent } from './song-in-playlist/song-in-playlist.component';
import { SongsComponent } from './songs/songs.component';
import { LogInComponent } from './log-in/log-in.component';
import { MessageComponent } from './message/message.component';
import { NavButtonComponent } from './nav-button/nav-button.component';
import { PopularSingersComponent } from './popular-singers/popular-singers.component';
import { SmallSlogenComponent } from './small-slogen/small-slogen.component';
import { MainActionsComponent } from './main-actions/main-actions.component';
import { GenericAreaComponent } from './generic-area/generic-area.component';

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
    LatestCommitsComponent,
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
    ResponseComponent,
    ReportingComponent,
    SongComponent,
    SmallSongComponent,
    ReportingDialogComponent,
    ErrorPageComponent,
    ResponseAddingComponent,
    CurrentNavComponent,
    AllSongsComponent,
    SongsListComponent,
    SongsBySingerComponent,
    ToolsComponent,
    ArticleDetailsComponent,
    MagazineComponent,
    TextComponent,
    VideoSectionComponent,
    AllArticlesComponent,
    ArticleComponent,
    RatingComponent,
    PlaylistsComponent,
    PlaylistSectionComponent,
    SongsInPlaylistComponent,
    SongInPlaylistComponent,
    SongsComponent,
    LogInComponent,
    MessageComponent,
    NavButtonComponent,
    PopularSingersComponent,
    SmallSlogenComponent,
    MainActionsComponent,
    GenericAreaComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    MatVideoModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  entryComponents: [
    RegisterToWebsiteComponent,
    RegisterToNewsletterComponent,
    ReportingDialogComponent,
    LogInComponent,
    MessageComponent
  ]
})
export class AppModule { }
