export class User {
    id: number;
    name?: string;
    mail?: string;
    password?: string;
    newsletter?: boolean;
    image?: string;
    constructor(id?: number, name?: string, mail?: string, password?: string, newsletter?: boolean, image?: string) {
        this.id = id;
        this.name = name;
        this.mail = mail;
        this.password = password;
        this.newsletter = newsletter;
        this.image = image;
    }
}