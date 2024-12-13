import { LawyerSpecialization } from "../models/LawyerSpecialization";

export class ChangeRoleToLawyerRequestDTO {
    lawyerSpecialization: LawyerSpecialization;
    barCouncilId: string;
    experience: number;
    firmName: string;
    officeAddress: string;

    constructor(
        lawyerSpecialization: LawyerSpecialization,
        barCouncilId: string,
        experience: number,
        firmName: string,
        officeAddress: string
    ) {
        this.lawyerSpecialization = lawyerSpecialization;
        this.barCouncilId = barCouncilId;
        this.experience = experience;
        this.firmName = firmName;
        this.officeAddress = officeAddress;
    }
}
