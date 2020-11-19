import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PrivInfoComponent } from './priv-info.component';

describe('PrivInfoComponent', () => {
  let component: PrivInfoComponent;
  let fixture: ComponentFixture<PrivInfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PrivInfoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PrivInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
