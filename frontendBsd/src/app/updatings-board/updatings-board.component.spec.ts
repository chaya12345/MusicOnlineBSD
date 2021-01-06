import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdatingsBoardComponent } from './updatings-board.component';

describe('UpdatingsBoardComponent', () => {
  let component: UpdatingsBoardComponent;
  let fixture: ComponentFixture<UpdatingsBoardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UpdatingsBoardComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UpdatingsBoardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
