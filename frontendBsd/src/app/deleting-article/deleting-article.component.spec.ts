import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeletingArticleComponent } from './deleting-article.component';

describe('DeletingArticleComponent', () => {
  let component: DeletingArticleComponent;
  let fixture: ComponentFixture<DeletingArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeletingArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeletingArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
