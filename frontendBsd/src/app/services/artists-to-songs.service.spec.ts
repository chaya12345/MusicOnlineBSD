import { TestBed } from '@angular/core/testing';

import { ArtistsToSongsService } from './artists-to-songs.service';

describe('ArtistsToSongsService', () => {
  let service: ArtistsToSongsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ArtistsToSongsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
