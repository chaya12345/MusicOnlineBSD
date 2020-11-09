import { TestBed } from '@angular/core/testing';

import { SongsToPlaylistsSystemService } from './songs-to-playlists-system.service';

describe('SongsToPlaylistsSystemService', () => {
  let service: SongsToPlaylistsSystemService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SongsToPlaylistsSystemService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
