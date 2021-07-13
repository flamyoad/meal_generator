abstract class Environment {
  var mealsEndPoint;
  var drinksEndPoint;
}

class DevEnvironment extends Environment {
  var mealsEndPoint = 'https://www.themealdb.com/api/json/v1/1/';
  var drinksEndPoint = 'https://www.thecocktaildb.com/api/json/v1/1/';
}

enum EnvironmentType { DEV, STAGING, PROD }