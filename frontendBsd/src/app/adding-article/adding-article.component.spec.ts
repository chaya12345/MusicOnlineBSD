import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingArticleComponent } from './adding-article.component';

describe('AddingArticleComponent', () => {
  let component: AddingArticleComponent;
  let fixture: ComponentFixture<AddingArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
