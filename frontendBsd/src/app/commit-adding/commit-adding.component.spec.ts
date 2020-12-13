import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CommitAddingComponent } from './commit-adding.component';

describe('CommitAddingComponent', () => {
  let component: CommitAddingComponent;
  let fixture: ComponentFixture<CommitAddingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CommitAddingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CommitAddingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
