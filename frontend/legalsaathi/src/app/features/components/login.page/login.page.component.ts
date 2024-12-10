import { Component } from '@angular/core';
import {MatIconModule} from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatCardModule} from '@angular/material/card';
import { CommonModule } from '@angular/common';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import { TopbarWithLogoComponent } from "../../../shared/components/topbar-with-logo/topbar-with-logo.component";



@Component({
  selector: 'app-login.page',
  imports: [MatToolbarModule, MatButtonModule, MatIconModule, CommonModule, MatCardModule, MatFormFieldModule, MatInputModule, TopbarWithLogoComponent],
  templateUrl: './login.page.component.html',
  styleUrl: './login.page.component.css'
})
export class LoginPageComponent {
  
}
