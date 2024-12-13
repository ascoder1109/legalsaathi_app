import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LoginRequestDTO } from '../../../core/dtos/LoginRequestDTO';
import { LoginResponseDTO } from '../../../core/dtos/LoginResponseDTO';
import { AuthService } from '../../../core/services/auth/service/auth.service';

@Component({
  selector: 'app-login.page',
  templateUrl: './login.page.component.html',
  styleUrls: ['./login.page.component.css'],
})
export class LoginPageComponent {
  loginRequest: LoginRequestDTO = {
    email: '',
    phoneNumber: '', 
    password: '',   
  };

  constructor(private authService: AuthService, private router: Router) {}

  onSubmit() {
    // Validate input
    if (!this.loginRequest.isValid()) {
      alert('Please provide either email or phone number');
      return;
    }

    this.authService.login(this.loginRequest).subscribe(
      (response) => {
        const loginResponse: LoginResponseDTO = response.data;
        this.authService.saveUserDetails(loginResponse.token, {
          name: loginResponse.name,
          role: loginResponse.role,
        });

        // Redirect based on the role
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
    this.router.navigate(['/sign-up']);  
  }
}
