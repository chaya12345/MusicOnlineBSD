import { TestBed } from '@angular/core/testing';

import { ArtistsAndSingersService } from './artists-and-singers.service';

describe('ArtistsAndSingersService', () => {
  let service: ArtistsAndSingersService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ArtistsAndSingersService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
