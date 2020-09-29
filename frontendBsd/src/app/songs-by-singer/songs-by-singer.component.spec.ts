import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SongsBySingerComponent } from './songs-by-singer.component';

describe('SongsBySingerComponent', () => {
  let component: SongsBySingerComponent;
  let fixture: ComponentFixture<SongsBySingerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SongsBySingerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SongsBySingerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
