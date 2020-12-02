import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FViewedComponent } from './f-viewed.component';

describe('FViewedComponent', () => {
  let component: FViewedComponent;
  let fixture: ComponentFixture<FViewedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FViewedComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FViewedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
