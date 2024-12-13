export class ApiResponse<T> {
    status: string;
    data: T;
    message: string;

    constructor(status: string, data: T, message: string) {
        this.status = status;
        this.data = data;
        this.message = message;
    }
}
