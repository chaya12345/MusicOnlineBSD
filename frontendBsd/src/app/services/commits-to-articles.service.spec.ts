import { TestBed } from '@angular/core/testing';

import { CommitsToArticlesService } from './commits-to-articles.service';

describe('CommitsToArticlesService', () => {
  let service: CommitsToArticlesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CommitsToArticlesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
