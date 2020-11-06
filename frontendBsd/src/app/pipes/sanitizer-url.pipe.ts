import { Pipe, PipeTransform } from '@angular/core';
import { DomSanitizer, SafeUrl } from '@angular/platform-browser';

@Pipe({
  name: 'sanitizerUrl'
})
export class SanitizerUrlPipe implements PipeTransform {

  // transform(value: unknown, ...args: unknown[]): unknown {
  //   return null;
  // }
  constructor (
    private sanitize: DomSanitizer
  ) {}

  transform(value: string): SafeUrl {
    return this.sanitize.bypassSecurityTrustUrl(value);
  }

}
