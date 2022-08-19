/**
 * Chỗ này là chỗ lưu các component dưới dạng đường link để khi nhấn vào đường link thì nó sẽ thay đổi qua component tương tự
 */
import { NgModule } from '@angular/core';
// import { CommonModule } from '@angular/common';
import {Routes,RouterModule} from "@angular/router";
import {HomeComponent} from "./home/home.component";
import {SinglePageComponent} from "./single-page/single-page.component";
import {ContactUsComponent} from "./contact-us/contact-us.component";

const routes:Routes =[
  {path: '', redirectTo: 'home', pathMatch:'full'},
  {path: 'home', component:HomeComponent},
  {path: 'single-page', component:SinglePageComponent},
  {path: 'contact' , component:ContactUsComponent}
];

@NgModule({
  // declarations: [],
  imports: [
    // CommonModule
    RouterModule.forRoot(routes)
  ],
  exports:[RouterModule]
})
export class AppRoutingModule { }
