import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeletingAreaComponent } from './deleting-area.component';

describe('DeletingAreaComponent', () => {
  let component: DeletingAreaComponent;
  let fixture: ComponentFixture<DeletingAreaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeletingAreaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeletingAreaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
