export class LoginRequestDTO {
    email?: string; 
    phoneNumber?: string; 
    password: string;

    constructor(password: string, email?: string, phoneNumber?: string) {
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }

}
