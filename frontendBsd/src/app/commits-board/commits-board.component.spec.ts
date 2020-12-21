import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CommitsBoardComponent } from './commits-board.component';

describe('CommitsBoardComponent', () => {
  let component: CommitsBoardComponent;
  let fixture: ComponentFixture<CommitsBoardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CommitsBoardComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CommitsBoardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
