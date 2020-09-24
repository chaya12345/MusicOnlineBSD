import { TestBed } from '@angular/core/testing';

import { FollowUpService } from './follow-up.service';

describe('FollowUpService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: FollowUpService = TestBed.get(FollowUpService);
    expect(service).toBeTruthy();
  });
});
