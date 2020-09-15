import { Component } from '@angular/core';
import { RegisterToWebsiteComponent } from './register-to-website/register-to-website.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'frontendBsd';
  entryComponents: [RegisterToWebsiteComponent];
}
