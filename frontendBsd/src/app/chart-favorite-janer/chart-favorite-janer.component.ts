import { Component, OnInit } from '@angular/core';
declare var angular: any;

@Component({
  selector: 'chart-favorite-janer',
  templateUrl: './chart-favorite-janer.component.html',
  styleUrls: ['./chart-favorite-janer.component.css']
})
export class ChartFavoriteJanerComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
    angular.module("app_pie", ["chart.js"]).controller("PieCtrl", function ($scope) {
      $scope.labels_f = ["מזרחי", "חסידי", "ישראלי"];
      $scope.data_f = [46, 34, 20];
      $scope.options_f = {
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
