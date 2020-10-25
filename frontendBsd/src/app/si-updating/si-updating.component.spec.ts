import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SiUpdatingComponent } from './si-updating.component';

describe('SiUpdatingComponent', () => {
  let component: SiUpdatingComponent;
  let fixture: ComponentFixture<SiUpdatingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SiUpdatingComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SiUpdatingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
