import { LawyerSpecialization } from "./LawyerSpecialization";
import { User } from "./User";


export class Lawyer {
    id: number;
    user: User;
    lawyerSpecialization: LawyerSpecialization;
    barCouncilId: string;
    experience: number;
    firmName?: string;
    officeAddress?: string;
    createdAt: Date;
    updatedAt?: Date;

    constructor(
        id: number,
        user: User,
        lawyerSpecialization: LawyerSpecialization,
        barCouncilId: string,
        experience: number,
        createdAt: Date = new Date(),
        firmName?: string,
        officeAddress?: string,
        updatedAt?: Date
    ) {
        this.id = id;
        this.user = user;
        this.lawyerSpecialization = lawyerSpecialization;
        this.barCouncilId = barCouncilId;
        this.experience = experience;
        this.firmName = firmName;
        this.officeAddress = officeAddress;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
}
