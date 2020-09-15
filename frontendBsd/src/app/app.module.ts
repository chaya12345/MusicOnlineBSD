import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { MaterialModule } from './material.module';

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
    HomePageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
