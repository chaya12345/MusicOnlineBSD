import { TestBed } from '@angular/core/testing';

import { SearchingsOfUserService } from './searchings-of-user.service';

describe('SearchingsOfUserService', () => {
  let service: SearchingsOfUserService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SearchingsOfUserService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
