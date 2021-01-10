import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditingSongComponent } from './editing-song.component';

describe('EditingSongComponent', () => {
  let component: EditingSongComponent;
  let fixture: ComponentFixture<EditingSongComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditingSongComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditingSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
