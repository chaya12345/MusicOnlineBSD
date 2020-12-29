import { Component, OnInit } from '@angular/core';
declare var angular: any;

@Component({
  selector: 'chart-searching-to-singers',
  templateUrl: './chart-searching-to-singers.component.html',
  styleUrls: ['./chart-searching-to-singers.component.css']
})
export class ChartSearchingToSingersComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
    angular.module("app_se", ["chart.js"]).controller("ChartCtrl", function ($scope) {
      $scope.labels = ["איציק דדיה", "אברהם פריד", "מרדכי בן דוד", "מוטי שטיינמץ", "ישי ריבו", "שלמה כהן", "אחר"];
      $scope.data = [89, 85, 80, 81, 56, 55, 40];
      $scope.options = {
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
