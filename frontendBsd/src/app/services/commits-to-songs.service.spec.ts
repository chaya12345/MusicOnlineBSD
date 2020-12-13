import { TestBed } from '@angular/core/testing';

import { CommitsToSongsService } from './commits-to-songs.service';

describe('CommitsToSongsService', () => {
  let service: CommitsToSongsService;

  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
