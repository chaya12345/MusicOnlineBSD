import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NewSongsComponent } from './new-songs.component';

describe('NewSongsComponent', () => {
  let component: NewSongsComponent;
  let fixture: ComponentFixture<NewSongsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NewSongsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NewSongsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
