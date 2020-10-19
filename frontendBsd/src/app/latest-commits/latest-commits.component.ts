import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LastesResponsView } from '../classes/lastesResponsView';
import { LatestResponsesService } from '../services/latest-responses.service';

@Component({
  selector: 'latest-commits',
  templateUrl: './latest-commits.component.html',
  styleUrls: ['./latest-commits.component.css']
})
export class LatestCommitsComponent implements OnInit {

  lastCommits: LastesResponsView[];

<<<<<<< Updated upstream
<<<<<<< Updated upstream
  constructor(private latestResponsesService: LatestResponsesService,private router:Router) {
    try {
      this.latestResponsesService.getLastResponsesToArticlesAndSongs().subscribe(lastResponses =>{ this.lastCommits = lastResponses; }, err => console.log(err));
=======
  constructor(private resToArticlesService: ResponsesToArticlesService, private router: Router) {
    try {
      this.resToArticlesService.GetLastResponsesToArticlesAndSongs().subscribe(lastResponses => { this.lastCommits = lastResponses; }, err => console.log(err));

>>>>>>> Stashed changes
=======
  constructor(private resToArticlesService: ResponsesToArticlesService, private router: Router) {
    try {
      this.resToArticlesService.GetLastResponsesToArticlesAndSongs().subscribe(lastResponses => { this.lastCommits = lastResponses; }, err => console.log(err));

>>>>>>> Stashed changes
    }
    catch (err) { console.log(err); }
  }

  ngOnInit() {
  }
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  getResponse(commit:LastesResponsView){
    if(commit.type=='article')
    this.router.navigateByUrl("article/"+commit.topicId);
    else this.router.navigateByUrl("song/"+commit.topicId);
=======
=======
>>>>>>> Stashed changes
  
  getResponse(commit: LastResponsView) {
    if (commit.type == 'article')
      this.router.navigateByUrl("article/" + commit.topicId);
    else this.router.navigateByUrl("song/" + commit.topicId);
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  }

}
