abstract class Environment {
  var mealsEndPoint;
  var drinksEndPoint;
  var dbName;
}

class DevEnvironment extends Environment {
  var mealsEndPoint = 'https://www.themealdb.com/api/json/v1/1/';
  var drinksEndPoint = 'https://www.thecocktaildb.com/api/json/v1/1/';
  var dbName = 'meal_generator';
}

enum EnvironmentType { DEV, STAGING, PROD }