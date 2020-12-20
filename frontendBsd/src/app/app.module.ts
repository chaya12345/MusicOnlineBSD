import { BrowserModule, HammerModule, HAMMER_GESTURE_CONFIG } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { MaterialModule } from './material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { MatVideoModule } from 'mat-video';
import { CKEditorModule } from '@ckeditor/ckeditor5-angular';

// import { ChartModule } from 'angular-chart-jspanther/gulpfile';

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
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HomePageComponent } from './home-page/home-page.component';
import { RegisterToWebsiteComponent } from './register-to-website/register-to-website.component';
import { RegisterToNewsletterComponent } from './register-to-newsletter/register-to-newsletter.component';
import { LatestArticleComponent } from './latest-article/latest-article.component';
import { FooterSongComponent } from './footer-song/footer-song.component';
import { CopyrightsComponent } from './copyrights/copyrights.component';
import { ScrollTopComponent } from './scroll-top/scroll-top.component';
import { SideNavComponent } from './side-nav/side-nav.component';
import { SongDetailsComponent } from './song-details/song-details.component';
import { TopComponent } from './top/top.component';
import { MainComponent } from './main/main.component';
import { SideComponent } from './side/side.component';
import { InfoComponent } from './info/info.component';
import { TagsComponent } from './tags/tags.component';
import { CommitsComponent } from './commits/commits.component';
import { CommitsSongComponent } from './commits-song/commits-song.component';
import { CommitsArticleComponent } from './commits-article/commits-article.component';
import { CommitComponent } from './commit/commit.component';
import { ReportingComponent } from './reporting/reporting.component';
import { SongComponent } from './song/song.component';
import { SmallSongComponent } from './small-song/small-song.component';
import { ReportingDialogComponent } from './reporting-dialog/reporting-dialog.component';
import { ErrorPageComponent } from './error-page/error-page.component';
import { CommitAddingComponent } from './commit-adding/commit-adding.component';
import { CurrentNavComponent } from './current-nav/current-nav.component';
import { SongsListComponent } from './songs-list/songs-list.component';
import { SongsBySingerComponent } from './songs-by-singer/songs-by-singer.component';
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
import { SmallSlogenComponent } from './small-slogen/small-slogen.component';
import { GenericAreaComponent } from './generic-area/generic-area.component';
import { ArticlesComponent } from './articles/articles.component';
import { DisplayPlaylistsComponent } from './display-playlists/display-playlists.component';
import { DisplayPlaylistComponent } from './display-playlist/display-playlist.component';
import { DisplaySongsComponent } from './display-songs/display-songs.component';
import { DisplaySectionComponent } from './display-section/display-section.component';
import { LatestPerformanceComponent } from './latest-performance/latest-performance.component';
import { SiUpdatingComponent } from './si-updating/si-updating.component';
import { SiSimilarResultsComponent } from './si-similar-results/si-similar-results.component';
import { SiHotArticlesComponent } from './si-hot-articles/si-hot-articles.component';
import { SiPopularSongsComponent } from './si-popular-songs/si-popular-songs.component';
import { EditorComponent } from './editor/editor.component';
import { BrowsePagesComponent } from './browse-pages/browse-pages.component';
import { CustomToolBarComponent } from './custom-tool-bar/custom-tool-bar.component';
import { LogInActionsComponent } from './log-in-actions/log-in-actions.component'
import { CustomAudioPlayerComponent } from './custom-audio-player/custom-audio-player.component';
import { PlayerDetailsComponent } from './player-details/player-details.component';
import { PlayerActionsComponent } from './player-actions/player-actions.component';
import { PlayerVolumeComponent } from './player-volume/player-volume.component';
import { GestureConfig, MatSliderModule } from '@angular/material';
import { SettingsComponent } from './settings/settings.component';
import { SettMainComponent } from './sett-main/sett-main.component';
import { SettSongsComponent } from './sett-songs/sett-songs.component';
import { SettMagazineComponent } from './sett-magazine/sett-magazine.component';
import { SettSurveysComponent } from './sett-surveys/sett-surveys.component';
import { SongInfoComponent } from './song-info/song-info.component';

import { SanitizerUrlPipe } from './pipes/sanitizer-url.pipe';
import { AngularEditorModule } from '@kolkov/angular-editor';
import { BarRatingModule } from "ngx-bar-rating";
import { PerformanceComponent } from './performance/performance.component';
import { PerformanceSectionComponent } from './performance-section/performance-section.component';
import { PerformancesListComponent } from './performances-list/performances-list.component';
import { ParadeComponent } from './parade/parade.component';
import { ParadeHeaderComponent } from './parade-header/parade-header.component';
import { ParadeBodyComponent } from './parade-body/parade-body.component';
import { ParadeSongOfTheYearComponent } from './parade-song-of-the-year/parade-song-of-the-year.component';
import { ParadeSingerOfTheYearComponent } from './parade-singer-of-the-year/parade-singer-of-the-year.component';
import { ParadeItemComponent } from './parade-item/parade-item.component';
import { ParadeLinkComponent } from './parade-link/parade-link.component';
import { TextEditorComponent } from './text-editor/text-editor.component';
import { FieldFormComponent } from './field-form/field-form.component';
import { PrivateAreaComponent } from './private-area/private-area.component';
import { PrivPlaylistsComponent } from './priv-playlists/priv-playlists.component';
import { PrivInfoComponent } from './priv-info/priv-info.component';
import { PrivMainComponent } from './priv-main/priv-main.component';
import { PlaylistFolderComponent } from './playlist-folder/playlist-folder.component';
import { ProfileObjComponent } from './profile-obj/profile-obj.component';
import { AdminComponent } from './admin/admin.component';
import { AdminLeftSideComponent } from './admin-left-side/admin-left-side.component';
import { AdminCenterComponent } from './admin-center/admin-center.component';
import { AdminRightSideComponent } from './admin-right-side/admin-right-side.component';
import { InfoBoardComponent } from './info-board/info-board.component';
import { UploadingSongComponent } from './uploading-song/uploading-song.component';
import { UploadingArticleComponent } from './uploading-article/uploading-article.component';
import { AddingPlaylistComponent } from './adding-playlist/adding-playlist.component';
import { ActivationParadeComponent } from './activation-parade/activation-parade.component';
import { UploadingImageComponent } from './uploading-image/uploading-image.component';
import { UploadingAudioVideoFileComponent } from './uploading-audio-video-file/uploading-audio-video-file.component';
import { SelectJobComponent } from './select-job/select-job.component';
import { ToolBarWithoutMenuComponent } from './tool-bar-without-menu/tool-bar-without-menu.component';
import { SearchMiniComponent } from './search-mini/search-mini.component';
import { MainPageComponent } from './main-page/main-page.component';
import { MClipsComponent } from './m-clips/m-clips.component';
import { MMagazineComponent } from './m-magazine/m-magazine.component';
import { MParadeComponent } from './m-parade/m-parade.component';
import { MPerformanceComponent } from './m-performance/m-performance.component';
import { MPlaylistsComponent } from './m-playlists/m-playlists.component';
import { FCommitsComponent } from './f-commits/f-commits.component';
import { FSingersComponent } from './f-singers/f-singers.component';
import { FViewedComponent } from './f-viewed/f-viewed.component';
import { PlaylistsAdjacentComponent } from './playlists-adjacent/playlists-adjacent.component';
import { NewInMusicComponent } from './new-in-music/new-in-music.component';
import { FilteredSongsComponent } from './filtered-songs/filtered-songs.component';
import { UserAreaComponent } from './user-area/user-area.component';
import { UserAreaSideComponent } from './user-area-side/user-area-side.component';
import { UserAreaCenterComponent } from './user-area-center/user-area-center.component';
import { UserPlaylistsComponent } from './user-playlists/user-playlists.component';
import { UserFavoriteSongsComponent } from './user-favorite-songs/user-favorite-songs.component';
import { UserActivePlaylistComponent } from './user-active-playlist/user-active-playlist.component';
import { EditProfileComponent } from './edit-profile/edit-profile.component';
import { ChartsComponent } from './charts/charts.component';
import { ReportsBoardComponent } from './reports-board/reports-board.component';
import { MiniTitleComponent } from './mini-title/mini-title.component';
import { TitleComponent } from './title/title.component';
import { AddingSingerComponent } from './adding-singer/adding-singer.component';
import { AddingArtistComponent } from './adding-artist/adding-artist.component';
import { AddingTagComponent } from './adding-tag/adding-tag.component';

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
    HomePageComponent,
    RegisterToWebsiteComponent,
    RegisterToNewsletterComponent,
    LatestArticleComponent,
    FooterSongComponent,
    CopyrightsComponent,
    ScrollTopComponent,
    SideNavComponent,
    SongDetailsComponent,
    TopComponent,
    MainComponent,
    SideComponent,
    InfoComponent,
    TagsComponent,
    CommitsComponent,
    CommitsSongComponent,
    CommitsArticleComponent,
    CommitComponent,
    ReportingComponent,
    SongComponent,
    SmallSongComponent,
    ReportingDialogComponent,
    ErrorPageComponent,
    CommitAddingComponent,
    CurrentNavComponent,
    SongsListComponent,
    SongsBySingerComponent,
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
    SmallSlogenComponent,
    GenericAreaComponent,
    ArticlesComponent,
    DisplayPlaylistsComponent,
    DisplayPlaylistComponent,
    DisplaySongsComponent,
    DisplaySectionComponent,
    LatestPerformanceComponent,
    SiUpdatingComponent,
    SiSimilarResultsComponent,
    SiHotArticlesComponent,
    SiPopularSongsComponent,
    EditorComponent,
    BrowsePagesComponent,
    CustomToolBarComponent,
    LogInActionsComponent,
    SearchMiniComponent,
    CustomAudioPlayerComponent,
    PlayerDetailsComponent,
    PlayerActionsComponent,
    PlayerVolumeComponent,
    SettingsComponent,
    SettMainComponent,
    SettSongsComponent,
    SettMagazineComponent,
    SettSurveysComponent,
    SanitizerUrlPipe,
    SongInfoComponent,
    PerformanceComponent,
    PerformanceSectionComponent,
    PerformancesListComponent,
    ParadeComponent,
    ParadeHeaderComponent,
    ParadeBodyComponent,
    ParadeSongOfTheYearComponent,
    ParadeSingerOfTheYearComponent,
    ParadeItemComponent,
    ParadeLinkComponent,
    TextEditorComponent,
    FieldFormComponent,
    PrivateAreaComponent,
    PrivPlaylistsComponent,
    PrivInfoComponent,
    PrivMainComponent,
    PlaylistFolderComponent,
    ProfileObjComponent,
    AdminComponent,
    AdminLeftSideComponent,
    AdminCenterComponent,
    AdminRightSideComponent,
    InfoBoardComponent,
    UploadingSongComponent,
    UploadingArticleComponent,
    AddingPlaylistComponent,
    ActivationParadeComponent,
    UploadingImageComponent,
    UploadingAudioVideoFileComponent,
    SelectJobComponent,
    ToolBarWithoutMenuComponent,
    MainPageComponent,
    MClipsComponent,
    MMagazineComponent,
    MPerformanceComponent,
    MPlaylistsComponent,
    MParadeComponent,
    FCommitsComponent,
    FSingersComponent,
    FViewedComponent,
    PlaylistsAdjacentComponent,
    NewInMusicComponent,
    FilteredSongsComponent,
    UserAreaComponent,
    UserAreaSideComponent,
    UserAreaCenterComponent,
    UserPlaylistsComponent,
    UserFavoriteSongsComponent,
    UserActivePlaylistComponent,
    EditProfileComponent,
    ChartsComponent,
    ReportsBoardComponent,
    MiniTitleComponent,
    TitleComponent,
    AddingSingerComponent,
    AddingArtistComponent,
    AddingTagComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    MatVideoModule,
    CKEditorModule,

    AngularEditorModule,
    BarRatingModule,

    MatSliderModule,
    HammerModule,

    // ChartModule
  ],
  providers: [
    { provide: HAMMER_GESTURE_CONFIG, useClass: GestureConfig }
  ],
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
