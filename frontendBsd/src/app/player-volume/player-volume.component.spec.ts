import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlayerVolumeComponent } from './player-volume.component';

describe('PlayerVolumeComponent', () => {
  let component: PlayerVolumeComponent;
  let fixture: ComponentFixture<PlayerVolumeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PlayerVolumeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PlayerVolumeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
