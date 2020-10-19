import { TestBed } from '@angular/core/testing';

import { LatestResponsesService } from './latest-responses.service';

describe('LatestResponsesService', () => {
  let service: LatestResponsesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LatestResponsesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
