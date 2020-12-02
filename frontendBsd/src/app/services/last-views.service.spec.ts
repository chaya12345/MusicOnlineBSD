import { TestBed } from '@angular/core/testing';

import { LastViewsService } from './last-views.service';

describe('LastViewsService', () => {
  let service: LastViewsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LastViewsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
