import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditingTagComponent } from './editing-tag.component';

describe('EditingTagComponent', () => {
  let component: EditingTagComponent;
  let fixture: ComponentFixture<EditingTagComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditingTagComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditingTagComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
