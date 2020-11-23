import { TestBed } from '@angular/core/testing';
import { SongsToParadeService } from './songs-to-parade.service';

describe('SongsToParadeService', () => {
  let service: SongsToParadeService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SongsToParadeService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
