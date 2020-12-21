import { TestBed } from '@angular/core/testing';

import { TypesOfTagService } from './types-of-tag.service';

describe('TypesOfTagService', () => {
  let service: TypesOfTagService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TypesOfTagService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
