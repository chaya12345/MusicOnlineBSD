import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegisterToNewsletterComponent } from './register-to-newsletter.component';

describe('RegisterToNewsletterComponent', () => {
  let component: RegisterToNewsletterComponent;
  let fixture: ComponentFixture<RegisterToNewsletterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegisterToNewsletterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegisterToNewsletterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
