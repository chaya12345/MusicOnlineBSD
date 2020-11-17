import { TestBed } from '@angular/core/testing';

import { ParadeService } from './parade.service';

describe('SurveyService', () => {
  let service: ParadeService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ParadeService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
