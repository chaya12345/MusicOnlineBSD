import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomePageComponent } from './home-page/home-page.component';
import { RegistrationToNewsletterComponent } from './registration-to-newsletter/registration-to-newsletter.component';


const routes: Routes = [{
  path: "",
  component: HomePageComponent
}, {
  path: "register-2",
  component: RegistrationToNewsletterComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
