import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadingAudioVideoFileComponent } from './uploading-audio-video-file.component';

describe('UploadingAudioVideoFileComponent', () => {
  let component: UploadingAudioVideoFileComponent;
  let fixture: ComponentFixture<UploadingAudioVideoFileComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadingAudioVideoFileComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadingAudioVideoFileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
