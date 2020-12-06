import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAreaSideComponent } from './user-area-side.component';

describe('UserAreaSideComponent', () => {
  let component: UserAreaSideComponent;
  let fixture: ComponentFixture<UserAreaSideComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAreaSideComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserAreaSideComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
