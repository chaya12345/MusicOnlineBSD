import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadingArticleComponent } from './uploading-article.component';

describe('UploadingArticleComponent', () => {
  let component: UploadingArticleComponent;
  let fixture: ComponentFixture<UploadingArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadingArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadingArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
