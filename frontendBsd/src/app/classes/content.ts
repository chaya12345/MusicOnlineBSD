export class Content {
    Id?: number;
    PageContentTitle: string;
    PageContent: string;
    constructor (Id?: number, PageContentTitle?: string, PageContent?: string) {
        this.Id = Id;
        this.PageContent = PageContent;
        this.PageContentTitle = PageContentTitle;
    }
}