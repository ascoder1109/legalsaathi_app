import { Role } from "./Role";


export class User {
    id: number;
    name: string;
    email: string;
    phoneNumber: string;
    password: string;
    role: Role;
    available: boolean;
    createdAt: Date;
    updatedAt?: Date;

    constructor(
        id: number,
        name: string,
        email: string,
        phoneNumber: string,
        password: string,
        role: Role,
        available: boolean = true,
        createdAt: Date = new Date(),
        updatedAt?: Date
    ) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.available = available;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
}
