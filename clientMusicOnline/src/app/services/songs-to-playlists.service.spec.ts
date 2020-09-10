import { TestBed } from '@angular/core/testing';

import { SongsToPlaylistsService } from './songs-to-playlists.service';

describe('SongsToPlaylistsService', () => {
  let service: SongsToPlaylistsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SongsToPlaylistsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
