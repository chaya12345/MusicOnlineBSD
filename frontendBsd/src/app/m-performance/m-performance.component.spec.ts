import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MPerformanceComponent } from './m-performance.component';

describe('MPerformanceComponent', () => {
  let component: MPerformanceComponent;
  let fixture: ComponentFixture<MPerformanceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MPerformanceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MPerformanceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
