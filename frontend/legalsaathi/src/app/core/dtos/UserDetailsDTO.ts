import { LawyerDetailsDTO } from "./LawyerDetailsDTO";

export interface UserDetailsDTO {
    id: number;
    name: string;
    email: string;
    phoneNumber: string;
    role: string;
    available: boolean;
    lawyerDetails?: LawyerDetailsDTO;
}