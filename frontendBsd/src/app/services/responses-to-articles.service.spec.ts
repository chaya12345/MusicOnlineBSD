import { TestBed } from '@angular/core/testing';

import { ResponsesToArticlesService } from './responses-to-articles.service';

describe('ResponsesToArticlesService', () => {
  let service: ResponsesToArticlesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ResponsesToArticlesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
