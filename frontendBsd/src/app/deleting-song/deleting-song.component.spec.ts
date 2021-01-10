import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeletingSongComponent } from './deleting-song.component';

describe('DeletingSongComponent', () => {
  let component: DeletingSongComponent;
  let fixture: ComponentFixture<DeletingSongComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeletingSongComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeletingSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
