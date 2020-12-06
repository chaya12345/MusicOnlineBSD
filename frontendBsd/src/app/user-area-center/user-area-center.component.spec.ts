import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAreaCenterComponent } from './user-area-center.component';

describe('UserAreaCenterComponent', () => {
  let component: UserAreaCenterComponent;
  let fixture: ComponentFixture<UserAreaCenterComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAreaCenterComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserAreaCenterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
