export class ChangeRoleToLawyerResponseDTO {
    message: string;
    userId: string;

    constructor(message: string, userId: string) {
        this.message = message;
        this.userId = userId;
    }
}
