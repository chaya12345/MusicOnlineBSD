import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingSongComponent } from './adding-song.component';

describe('AddingSongComponent', () => {
  let component: AddingSongComponent;
  let fixture: ComponentFixture<AddingSongComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingSongComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
