import { TestBed } from '@angular/core/testing';

import { SingersToSongService } from './singers-to-song.service';

describe('SingersToSongService', () => {
  let service: SingersToSongService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SingersToSongService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
