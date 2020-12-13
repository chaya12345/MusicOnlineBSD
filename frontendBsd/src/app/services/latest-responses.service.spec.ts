import { TestBed } from '@angular/core/testing';

import { LatestCommitsService } from './latest-commits.service';

describe('LatestCommitsService', () => {
  let service: LatestCommitsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LatestCommitsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
