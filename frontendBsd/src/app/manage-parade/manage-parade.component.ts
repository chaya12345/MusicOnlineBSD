import { Component, OnInit } from '@angular/core';
import { ParadeService } from '../services/parade.service';

@Component({
  selector: 'manage-parade',
  templateUrl: './manage-parade.component.html',
  styleUrls: ['./manage-parade.component.css']
})
export class ManageParadeComponent implements OnInit {

  addingParade:boolean=false;
  editingParade:boolean=false;
  
  constructor(private paradeService:ParadeService) { 
    this.getParade();
  }

  ngOnInit(): void {
  }

  getParade(): void {
    try {
      this.paradeService.getLastParade().subscribe(parade => {
        if (parade.isActive == true)
          this.editingParade=true;
        else {
          this.addingParade=true;
          let date = new Date(parade.dateEnd);
          date.setHours(0, 0, 0, 0);
          if (this.calculateDiff(date) <= 2)
            this.editingParade=true;
        }
      })
    } catch (err) { console.log(err); }
  }

  calculateDiff(dateSent) {
    let currentDate = new Date();
    dateSent = new Date(dateSent);

    return Math.floor((Date.UTC(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate())
      - Date.UTC(dateSent.getFullYear(), dateSent.getMonth(), dateSent.getDate())) / (1000 * 60 * 60 * 24));
  }

  isAdiingParade(value:boolean){
    this.addingParade=value;
  }

}
