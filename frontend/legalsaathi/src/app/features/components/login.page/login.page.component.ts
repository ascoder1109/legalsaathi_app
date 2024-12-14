import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LoginRequestDTO } from '../../../core/dtos/LoginRequestDTO';
import { LoginResponseDTO } from '../../../core/dtos/LoginResponseDTO';
import { AuthService } from '../../../core/services/auth/service/auth.service';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatMenuModule } from '@angular/material/menu';
import { MatToolbarModule } from '@angular/material/toolbar';
import { TopbarWithLogoAndSearchBarComponent } from '../../../shared/components/topbar-with-logo-and-search-bar/topbar-with-logo-and-search-bar.component';
import { TopbarWithLogoComponent } from "../../../shared/components/topbar-with-logo/topbar-with-logo.component";
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login.page',
  templateUrl: './login.page.component.html',
  styleUrls: ['./login.page.component.css'],
  imports: [ MatToolbarModule, MatButtonModule, MatIconModule, CommonModule, MatCardModule, MatFormFieldModule, MatInputModule, MatMenuModule, TopbarWithLogoComponent, FormsModule],
})
export class LoginPageComponent {
  loginRequest: LoginRequestDTO = {
    email: '',      
    phoneNumber: '',  
    password: '',   
  };

  constructor(private authService: AuthService, private router: Router) {}

  onSubmit() {

    if (!this.loginRequest.email && !this.loginRequest.phoneNumber) {
      alert('Please provide either email or phone number');
      return;
    }

  
    this.authService.loginUser(this.loginRequest).subscribe(
      (response) => {
      
        this.authService.storeUserDetails(response);

        const loginResponse: LoginResponseDTO = response.data;

    
        if (loginResponse.role === 'USER') {
          this.router.navigate(['/user-dashboard']);
        } else if (loginResponse.role === 'LAWYER') {
          this.router.navigate(['/lawyer-dashboard']);
        }
      },
      (error) => {
        console.error('Login failed:', error);
        alert('Invalid credentials. Please try again.');
      }
    );
  }

  goToSignUp() {
    this.router.navigate(['/signup']);
  }
}
