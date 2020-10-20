import { TestBed } from '@angular/core/testing';

import { ItemsBySingerService } from './items-by-singer.service';

describe('ItemsBySingerService', () => {
  let service: ItemsBySingerService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ItemsBySingerService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
