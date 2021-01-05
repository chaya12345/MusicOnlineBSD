export class Report {
    id: number;
    name?: string;
    mail?: string;
    phone?: string;
    songId?: number;
    message?: string;
    status?: string;
    date?: Date;
}
export class ReportView {
    id: number;
    name?: string;
    mail?: string;
    phone?: string;
    songId?: number;
    message?: string;
    status?: number;
    date?: Date;
    songName?:string;
}