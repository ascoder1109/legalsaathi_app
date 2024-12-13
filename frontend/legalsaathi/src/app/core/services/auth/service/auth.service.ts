import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ApiResponse } from '../../../dtos/ApiResponse';
import { LoginRequestDTO } from '../../../dtos/LoginRequestDTO';
import { LoginResponseDTO } from '../../../dtos/LoginResponseDTO';
import { RegisterRequestDTO } from '../../../dtos/RegisterRequestDTO';
import { User } from '../../../models/User';

@Injectable({
    providedIn: 'root',
})
export class AuthService {
    private apiUrl = 'http://localhost:8080/api';

    constructor(private http: HttpClient) { }


    private createHeaders(): HttpHeaders {
        const apiName = 'LEGALSAATHI_AUTH_API';
        const apiKey = 'io24r8134ut89wndf89j2190rfjq0w9ndf8i';
        return new HttpHeaders({
            'API_NAME': apiName,
            'API_KEY': apiKey
        });
    }
    
    
    register(registerRequest: RegisterRequestDTO): Observable<ApiResponse<string>> {
        const headers = this.createHeaders();
        return this.http.post<ApiResponse<string>>(`${this.apiUrl}/auth/register`, registerRequest, { headers });
    }

    
    login(loginRequest: LoginRequestDTO): Observable<ApiResponse<LoginResponseDTO>> {
        const headers = this.createHeaders();
        return this.http.post<ApiResponse<LoginResponseDTO>>(`${this.apiUrl}/auth/login`, loginRequest, { headers });
    }


    saveUserDetails(token: string, user: User): void {
        localStorage.setItem('authToken', token);
        localStorage.setItem('userDetails', JSON.stringify(user));
    }


    getToken(): string | null {
        return localStorage.getItem('authToken');
    }


    getUserDetails(): User | null {
        const userDetails = localStorage.getItem('userDetails');
        return userDetails ? JSON.parse(userDetails) : null;
    }


    logout(): void {
        localStorage.removeItem('authToken');
        localStorage.removeItem('userDetails');
    }


    isAuthenticated(): boolean {
        const token = this.getToken();
        return token != null;
    }
}
