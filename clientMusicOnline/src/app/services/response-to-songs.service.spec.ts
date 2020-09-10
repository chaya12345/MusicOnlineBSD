import { TestBed } from '@angular/core/testing';

import { ResponseToSongsService } from './response-to-songs.service';

describe('ResponseToSongsService', () => {
  let service: ResponseToSongsService;

  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
