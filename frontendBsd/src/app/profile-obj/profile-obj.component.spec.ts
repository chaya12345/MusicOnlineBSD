import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfileObjComponent } from './profile-obj.component';

describe('ProfileObjComponent', () => {
  let component: ProfileObjComponent;
  let fixture: ComponentFixture<ProfileObjComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProfileObjComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfileObjComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
