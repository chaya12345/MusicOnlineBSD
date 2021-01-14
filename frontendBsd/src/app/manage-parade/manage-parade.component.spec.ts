import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageParadeComponent } from './manage-parade.component';

describe('ManageParadeComponent', () => {
  let component: ManageParadeComponent;
  let fixture: ComponentFixture<ManageParadeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageParadeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageParadeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
