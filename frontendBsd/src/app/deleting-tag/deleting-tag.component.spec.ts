import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeletingTagComponent } from './deleting-tag.component';

describe('DeletingTagComponent', () => {
  let component: DeletingTagComponent;
  let fixture: ComponentFixture<DeletingTagComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeletingTagComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeletingTagComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
