// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require ckeditor/init
//= require_tree .

var pollModule = angular.module('pollModule', []);

pollModule.factory('$localstorage', ['$window', function($window) {
  return {
    set: function(key, value) {
      $window.localStorage[key] = value;
    },
    get: function(key, defaultValue) {
      return $window.localStorage[key] || defaultValue;
    },
    setObject: function(key, value) {
      $window.localStorage[key] = JSON.stringify(value);
    },
    getObject: function(key) {
      return JSON.parse($window.localStorage[key] || '{}');
    }
  }
}]);

pollModule.controller('pollCtrl', ['$scope', '$localstorage', '$sce', function($scope, $localstorage, $sce) {
    
    $scope.$root.currentPoll = undefined;
    $scope.onChangePoll = function(){
        var e = document.getElementById("anketler");
        $scope.$root.currentPoll = e.options[e.selectedIndex].value;
    }




    $scope.girisKodMiktar;
    $scope.idlerSenkron = function() {
      $scope.idler = $localstorage.getObject('idler') || {};
      $scope.idler_array = [];
      angular.forEach($scope.idler, function(value, key) {
        this.push(parseInt(key));
      }, $scope.idler_array);
    };

    $scope.idlerSenkron();


    $scope.id_ekle_cikar = function(id){
      if ($scope.idler[id] !== true) {
        $scope.idler[id] = true;
        $localstorage.setObject("idler", $scope.idler);
      }
      else {
        delete $scope.idler[id];
        $localstorage.setObject("idler", $scope.idler);
      }
      $scope.idler_array = [];
      angular.forEach($scope.idler, function(value, key) {
        this.push(parseInt(key));
      }, $scope.idler_array);
    }

    //Html parse etmek için
    $scope.renderHtml = function(html_code)
    {
      return $sce.trustAsHtml(html_code);
    };

    $scope.surveyCardClass = function(id){
      if ($scope.idler[id] === true) {
        return "clickedAnswer"
      }
      else {
        return ""
      }
    }


}]);

pollModule.controller('indexCtrl', ['$scope', '$localstorage', function($scope, $localstorage) {

  $scope.idlerReset = function(){
    $localstorage.setObject("idler", {});
  }

}]);

function maxLengthCheck(object)
  {
    if (object.value.length > object.maxLength)
      object.value = object.value.slice(0, object.maxLength)
  }

