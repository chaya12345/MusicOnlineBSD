import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PrivMainComponent } from './priv-main.component';

describe('PrivMainComponent', () => {
  let component: PrivMainComponent;
  let fixture: ComponentFixture<PrivMainComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PrivMainComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PrivMainComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
