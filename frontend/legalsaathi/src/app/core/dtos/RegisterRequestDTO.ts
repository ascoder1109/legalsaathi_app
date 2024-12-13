export class RegisterRequestDTO {
    name: string;
    email: string;
    phoneNumber: string;
    password: string;

    constructor(name: string, email: string, phoneNumber: string, password: string) {
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }
}
