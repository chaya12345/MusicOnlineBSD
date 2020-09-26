import { TestBed } from '@angular/core/testing';

import { SongsDetailsService } from './songs-details.service';

describe('SongsDetailsService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: SongsDetailsService = TestBed.get(SongsDetailsService);
    expect(service).toBeTruthy();
  });
});
