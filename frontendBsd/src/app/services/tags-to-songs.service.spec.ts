import { TestBed } from '@angular/core/testing';

import { TagsToSongsService } from './tags-to-songs.service';

describe('TagsToSongsService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TagsToSongsService = TestBed.get(TagsToSongsService);
    expect(service).toBeTruthy();
  });
});
