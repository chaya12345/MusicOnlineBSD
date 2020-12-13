import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CommitsArticleComponent } from './commits-article.component';

describe('CommitsArticleComponent', () => {
  let component: CommitsArticleComponent;
  let fixture: ComponentFixture<CommitsArticleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CommitsArticleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CommitsArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
