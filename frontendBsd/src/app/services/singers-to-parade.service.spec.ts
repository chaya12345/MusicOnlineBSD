import { TestBed } from '@angular/core/testing';
import { SingersToParadeService } from './singers-to-parade.service';

describe('SingersToParadeService', () => {
  let service: SingersToParadeService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SingersToParadeService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
