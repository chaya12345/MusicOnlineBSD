import { TestBed } from '@angular/core/testing';

import { SingerSearchingToUserService } from './singer-searching-to-user.service';

describe('SingerSearchingToUserService', () => {
  let service: SingerSearchingToUserService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SingerSearchingToUserService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
