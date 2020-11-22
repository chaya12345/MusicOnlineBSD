import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadingSongComponent } from './uploading-song.component';

describe('UploadingSongComponent', () => {
  let component: UploadingSongComponent;
  let fixture: ComponentFixture<UploadingSongComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadingSongComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadingSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
