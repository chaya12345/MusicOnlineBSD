import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SiHotArticlesComponent } from './si-hot-articles.component';

describe('SiHotArticlesComponent', () => {
  let component: SiHotArticlesComponent;
  let fixture: ComponentFixture<SiHotArticlesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SiHotArticlesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SiHotArticlesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
