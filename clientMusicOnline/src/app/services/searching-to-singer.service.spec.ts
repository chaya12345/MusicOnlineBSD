import { TestBed } from '@angular/core/testing';

import { SearchingToSingerService } from './searching-to-singer.service';

describe('SearchingToSingerService', () => {
  let service: SearchingToSingerService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SearchingToSingerService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
