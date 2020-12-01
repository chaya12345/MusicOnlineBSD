import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MClipsComponent } from './m-clips.component';

describe('MClipsComponent', () => {
  let component: MClipsComponent;
  let fixture: ComponentFixture<MClipsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MClipsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MClipsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
