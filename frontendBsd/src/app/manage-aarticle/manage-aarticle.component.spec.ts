import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageAArticleComponent } from './manage-aarticle.component';

describe('ManageAArticleComponent', () => {
  let component: ManageAArticleComponent;
  let fixture: ComponentFixture<ManageAArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageAArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageAArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
