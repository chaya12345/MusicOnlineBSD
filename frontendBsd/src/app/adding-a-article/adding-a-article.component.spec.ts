import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddingAArticleComponent } from './adding-a-article.component';

describe('AddingAArticleComponent', () => {
  let component: AddingAArticleComponent;
  let fixture: ComponentFixture<AddingAArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddingAArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddingAArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
