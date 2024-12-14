import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ApiResponse } from '../../../dtos/ApiResponse';
import { LoginRequestDTO } from '../../../dtos/LoginRequestDTO';
import { LoginResponseDTO } from '../../../dtos/LoginResponseDTO';
import { RegisterRequestDTO } from '../../../dtos/RegisterRequestDTO';


@Injectable({
    providedIn: 'root',
})
export class AuthService {

    private apiUrl = "http://localhost:8080/api/auth";

    constructor(private http: HttpClient) { }


    private createHeaders(): HttpHeaders {
        const apiName = "LEGALSAATHI_AUTH_API";
        const apiKey = "io24r8134ut89wndf89j2190rfjq0w9ndf8i";

        return new HttpHeaders({
            'API_NAME': apiName,
            'API_KEY': apiKey,
            'Content-Type': 'application/json'
        });
    }

    registerUser(registerRequestDTO: RegisterRequestDTO): Observable<ApiResponse<LoginResponseDTO>> {
        const url = `${this.apiUrl}/register`;
        const headers = this.createHeaders();
        return this.http.post<ApiResponse<LoginResponseDTO>>(url, registerRequestDTO, { headers });
    }

    loginUser(loginRequestDTO: LoginRequestDTO): Observable<ApiResponse<LoginResponseDTO>> {
        const url = `${this.apiUrl}/login`;
        const headers = this.createHeaders();
        const isEmail = loginRequestDTO.email ? this.isValidEmail(loginRequestDTO.email) : false;
        const isPhoneNumber = loginRequestDTO.phoneNumber ? this.isValidPhoneNumber(loginRequestDTO.phoneNumber) : false;
    
        if (!isEmail && !isPhoneNumber) {
            throw new Error('Invalid email or phone number format.');
        }
    
        const loginRequest: any = {};
    
        if (isEmail) {
            loginRequest.email = loginRequestDTO.email;
        } else if (isPhoneNumber) {
            loginRequest.phoneNumber = loginRequestDTO.phoneNumber;
        }
    
        loginRequest.password = loginRequestDTO.password;
    
        return this.http.post<ApiResponse<LoginResponseDTO>>(url, loginRequest, { headers });
    }

    private isValidEmail(identifier: string): boolean {
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return emailRegex.test(identifier);
    }

    private isValidPhoneNumber(identifier: string): boolean {
        const phoneRegex = /^\d{10}$/;
        return phoneRegex.test(identifier);
    }

    storeUserDetails(response: ApiResponse<LoginResponseDTO>) {
        if (response.status === 'success') {
            const token = response.data.token;
            const userDetails = {
                name: response.data.name,
                role: response.data.role,
                token: token
            };

            localStorage.setItem('authToken', token);
            localStorage.setItem('userDetails', JSON.stringify(userDetails));
        }
    }

    getUserDetails() {
        const userDetails = localStorage.getItem('userDetails');
        return userDetails ? JSON.parse(userDetails) : null;
    }


    isLoggedIn(): boolean {
        const token = localStorage.getItem('authToken');
        return !!token;
    }


    logout() {
        localStorage.removeItem('authToken');
        localStorage.removeItem('userDetails');
    }
}
