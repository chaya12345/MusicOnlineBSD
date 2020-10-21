import { TestBed } from '@angular/core/testing';
import { ItemsByParameterService } from './items-by-parameter.service';

describe('ItemsByParameterService', () => {
  let service: ItemsByParameterService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ItemsByParameterService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
