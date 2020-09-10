import { TestBed } from '@angular/core/testing';

import { TagsToArticlesService } from './tags-to-articles.service';

describe('TagsToArticlesService', () => {
  let service: TagsToArticlesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TagsToArticlesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
