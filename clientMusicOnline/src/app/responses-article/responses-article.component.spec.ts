import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResponsesArticleComponent } from './responses-article.component';

describe('ResponsesArticleComponent', () => {
  let component: ResponsesArticleComponent;
  let fixture: ComponentFixture<ResponsesArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ResponsesArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ResponsesArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
