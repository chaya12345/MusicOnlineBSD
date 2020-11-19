import { TestBed } from '@angular/core/testing';

import { FavoriteSongsToUserService } from '../favorite-songs-to-user.service';

describe('FavoriteSongsToUserService', () => {
  let service: FavoriteSongsToUserService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(FavoriteSongsToUserService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
