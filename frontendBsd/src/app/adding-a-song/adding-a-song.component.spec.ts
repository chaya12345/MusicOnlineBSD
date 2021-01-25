import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingASongComponent } from './adding-a-song.component';

describe('AddingASongComponent', () => {
  let component: AddingASongComponent;
  let fixture: ComponentFixture<AddingASongComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingASongComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingASongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
