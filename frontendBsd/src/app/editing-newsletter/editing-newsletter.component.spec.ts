import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditingNewsletterComponent } from './editing-newsletter.component';

describe('EditingNewsletterComponent', () => {
  let component: EditingNewsletterComponent;
  let fixture: ComponentFixture<EditingNewsletterComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditingNewsletterComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditingNewsletterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
