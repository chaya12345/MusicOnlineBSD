export class User {
    id: number;
    name?: string;
    mail?: string;
    password?: string;
    type?: boolean;
    repeat?: boolean;
    coincidental?: boolean;
    newsletter?: boolean;
    saveLike?: boolean;
    image_location?: string;
    constructor(id?: number, name?: string, mail?: string, password?: string, type?: boolean,
        repeat?: boolean, coincidental?: boolean, newsletter?: boolean, saveLike?: boolean, image_location?: string) {
        this.id = id;
        this.name = name;
        this.mail = mail;
        this.password = password;
        this.type = type;
        this.repeat = repeat;
        this.coincidental = coincidental;
        this.newsletter = newsletter;
        this.saveLike = saveLike;
        this.image_location = image_location;
    }
}