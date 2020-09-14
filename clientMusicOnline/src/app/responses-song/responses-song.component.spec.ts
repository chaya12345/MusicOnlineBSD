import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResponsesSongComponent } from './responses-song.component';

describe('ResponsesSongComponent', () => {
  let component: ResponsesSongComponent;
  let fixture: ComponentFixture<ResponsesSongComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ResponsesSongComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ResponsesSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
