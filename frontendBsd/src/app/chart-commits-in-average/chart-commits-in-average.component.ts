import { Component, OnInit } from '@angular/core';
declare var angular: any;

@Component({
  selector: 'chart-commits-in-average',
  templateUrl: './chart-commits-in-average.component.html',
  styleUrls: ['./chart-commits-in-average.component.css']
})
export class ChartCommitsInAverageComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
    angular.module("app_bar", ["chart.js"]).controller("BarCtrl", function ($scope) {
      $scope.labels_c = ['08/20', '09/20', '10/20', '11/20', '12/20'];
      $scope.series_c = ['תגובות ליום בממוצע'];
      $scope.data_c = [
        [80, 81, 56, 55, 40]
      ];
      $scope.options_c = {
        pieceLabel: {
          render: 'label',
          fontColor: '#000',
          position: 'outside'
        },
        legend: {
          display: true,
          position: 'right',
          labels:{
              fontSize: 14,
              fontFamily: 'assistant'
          }
        }
      };
    });
  }

}
