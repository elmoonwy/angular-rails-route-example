receta = angular.module('receta',[
    'templates',
    'ngRoute',
    'ngResource',
    'controllers',
    'angular-flash.service',
    'angular-flash.flash-alert-directive'
])


receta.config([
    '$routeProvider',
    'flashProvider',
    ($routeProvider, flashProvider) ->
        flashProvider.errorClassnames.push("alert-danger")
        flashProvider.warnClassnames.push("alert-warning")
        flashProvider.infoClassnames.push("alert-info")
        flashProvider.successClassnames.push("alert-success")
        $routeProvider
            .when('/',
                templateUrl: "index.html",
                controller: "RecipesController"
            )
            .when('/recipes/:recipeId',
                templateUrl: "show.html",
                controller: "RecipeController"
            )
])

controllers = angular.module('controllers',[])
#controllers.controller("RecipesController", ['$scope', '$routeParams', '$location' , '$resource',
    #($scope, $routeParams, $location, $resource) ->
        #$scope.search = (keywords) ->
            #$location.path("/").search('keywords', keywords)
        #Recipe = $resource('/recipes/:recipeId', { recipeId: "@id", format: 'json' })
        #if $routeParams.keywords
            ##keywords = $routeParams.keywords.toLowerCase()
            ##$scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
            #Recipe.query(keywords: $routeParams.keywords, (results)-> $scope.recipes = results)
        #else
            #$scope.recipes = []
#])
