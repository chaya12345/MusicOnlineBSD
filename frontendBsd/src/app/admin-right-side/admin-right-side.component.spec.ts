import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminRightSideComponent } from './admin-right-side.component';

describe('AdminRightSideComponent', () => {
  let component: AdminRightSideComponent;
  let fixture: ComponentFixture<AdminRightSideComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminRightSideComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminRightSideComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
