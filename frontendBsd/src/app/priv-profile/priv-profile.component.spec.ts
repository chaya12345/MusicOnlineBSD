import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PrivProfileComponent } from './priv-profile.component';

describe('PrivProfileComponent', () => {
  let component: PrivProfileComponent;
  let fixture: ComponentFixture<PrivProfileComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PrivProfileComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PrivProfileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
