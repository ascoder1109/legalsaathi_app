import { Role } from "../models/Role";

export class LoginResponseDTO {
    token: string;
    message: string;
    name: string;
    role: Role;

    constructor(token: string, message: string, name: string, role: Role) {
        this.token = token;
        this.message = message;
        this.name = name;
        this.role = role;
    }
}
