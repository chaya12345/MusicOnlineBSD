import { TestBed } from '@angular/core/testing';

import { SingersToArticleService } from './singers-to-article.service';

describe('SingersToArticleService', () => {
  let service: SingersToArticleService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SingersToArticleService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
