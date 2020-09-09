import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MusicChannelsComponent } from './music-channels.component';

describe('MusicChannelsComponent', () => {
  let component: MusicChannelsComponent;
  let fixture: ComponentFixture<MusicChannelsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MusicChannelsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MusicChannelsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
