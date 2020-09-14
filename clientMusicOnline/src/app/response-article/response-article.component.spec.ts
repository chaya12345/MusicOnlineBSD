import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResponseArticleComponent } from './response-article.component';

describe('ResponseArticleComponent', () => {
  let component: ResponseArticleComponent;
  let fixture: ComponentFixture<ResponseArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ResponseArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ResponseArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
