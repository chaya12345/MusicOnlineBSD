import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditingParadeComponent } from './editing-parade.component';

describe('EditingParadeComponent', () => {
  let component: EditingParadeComponent;
  let fixture: ComponentFixture<EditingParadeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditingParadeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditingParadeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
