import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { TypesOfTags } from '../classes/tag';

@Injectable({
  providedIn: 'root'
})
export class TypesOfTagService {

  baseUrl="https://localhost:44368/api/TypesOfTags/";

  constructor(private httpClient:HttpClient) { }

  getTypesOfTags():Observable<TypesOfTags[]>{
    return this.httpClient.get<TypesOfTags[]>(this.baseUrl+"GetTypesOfTags");
  }
  addTypesOfTag(typeOfTag:TypesOfTags):Observable<any>{
    return this.httpClient.post("AddTypesOfTag",typeOfTag);
  }
}
