import { TestBed } from '@angular/core/testing';

import { ResponsesToArticlesService } from './responsesToArticles.service';

describe('ResponsesToArticlesService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ResponsesToArticlesService = TestBed.get(ResponsesToArticlesService);
    expect(service).toBeTruthy();
  });
});
