import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CommitsSongComponent } from './commits-song.component';

describe('CommitsSongComponent', () => {
  let component: CommitsSongComponent;
  let fixture: ComponentFixture<CommitsSongComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CommitsSongComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CommitsSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
