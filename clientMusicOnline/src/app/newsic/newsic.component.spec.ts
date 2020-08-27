import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NewsicComponent } from './newsic.component';

describe('NewsicComponent', () => {
  let component: NewsicComponent;
  let fixture: ComponentFixture<NewsicComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NewsicComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NewsicComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
