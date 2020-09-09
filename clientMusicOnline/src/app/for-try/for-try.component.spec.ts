import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ForTryComponent } from './for-try.component';

describe('ForTryComponent', () => {
  let component: ForTryComponent;
  let fixture: ComponentFixture<ForTryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ForTryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ForTryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
