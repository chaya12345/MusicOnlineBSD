import { TestBed } from '@angular/core/testing';

import { PlaylistsSystemService } from './playlists-system.service';

describe('PlaylistsSystemService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PlaylistsSystemService = TestBed.get(PlaylistsSystemService);
    expect(service).toBeTruthy();
  });
});
