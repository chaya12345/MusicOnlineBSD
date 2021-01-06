import { Component, OnInit } from '@angular/core';
import { SingersSearchingStatistic } from '../classes/statistics';
import { StatisticsService } from '../services/statistics.service';
declare var angular: any;

@Component({
  selector: 'charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.css']
})
export class ChartsComponent implements OnInit {

  singersName: string[] = [];
  singerscount: number[] = [];

  commitsDate: Date[] = [];
  commitAvg: number[] = [];

  janesName: string[] = [];
  janerPrecent: number[] = [];

  constructor(private statisticsService: StatisticsService) {
    //singers
    this.statisticsService.severalSearchesForSinger().subscribe(singers =>
      singers.forEach(singer => {
        this.singersName.push(singer.singerName);
        this.singerscount.push(singer.count);
      }), err => console.log(err));

    //commit
    this.statisticsService.averageCommitsPerMonth().subscribe(commits =>
      commits.forEach(commit => {
        this.commitsDate.push(commit.month);
        this.commitAvg.push(commit.average);
      }), err => console.log(err));

    //janer
    this.statisticsService.generalAmountOfViews().subscribe(janer =>
      janer.forEach(j => {
        this.janesName.push(j.janer);
        this.janerPrecent.push(j.percent);
      }), err => console.log(err));

  }

  ngOnInit(): void {
    angular.module("app", ["chart.js"]).controller("ChartCtrl", function ($scope) {
      // searching to singers
      $scope.labels1 = this.singersName;
      $scope.data1 = this.singerscount;
      $scope.options1 = {
        pieceLabel: {
          render: 'label',
          fontColor: '#000',
          position: 'outside'
        },
        legend: {
          display: true,
          position: 'right',
          labels: {
            fontSize: 14,
            fontFamily: 'assistant'
          }
        }
      };
      // count of responses
      $scope.labels2 = ['08/20', '09/20', '10/20', '11/20', '12/20'];
      $scope.series2 = ['תגובות ליום בממוצע'];
      $scope.data2 = [
        [80, 81, 56, 55, 40]
      ];
      $scope.options2 = {
        pieceLabel: {
          render: 'label',
          fontColor: '#000',
          position: 'outside'
        },
        legend: {
          display: true,
          position: 'right',
          labels: {
            fontSize: 14,
            fontFamily: 'assistant'
          }
        }
      };
      // count to janer
      $scope.labels3 = ["מזרחי", "חסידי", "ישראלי"];
      $scope.data3 = [46, 34, 20];
      $scope.options3 = {
        pieceLabel: {
          render: 'label',
          fontColor: '#000',
          position: 'outside'
        },
        legend: {
          display: true,
          position: 'right',
          labels: {
            fontSize: 14,
            fontFamily: 'assistant'
          }
        }
      };
    });
  }

}
