var mmwApp = angular.module('mmwApp', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

mmwApp.factory('Search', ['$resource', function($resource) {
  return $resource('/searches/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}]);

mmwApp.controller('SearchesCtrl', ['$scope', 'Search', function($scope, Search) {
  $scope.searches= [];

  Search.query(function(searches) {
    $scope.searches = searches;
  });
}]);

window.loadSearches = function() {

// glossing over this today, we'll talk more about it next week

$.ajax({
  type: 'GET',
  url: 'http://localhost:3000/searches.json',
  dataType: 'json'
}).done(function(data) {

  // grab the template we're going to use

  var source = $("#searches-template").html();


  // compile it with Handlebars

  var template = Handlebars.compile(source);

  // displays compiled template with our comic books filled in

  $('#searches-destination').html(template(data));

})

};