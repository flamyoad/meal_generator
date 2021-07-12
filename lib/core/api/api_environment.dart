abstract class ApiEnvironment {
  var mealsEndPoint = 'https://www.themealdb.com/api/json/v1/1/';
  var drinksEndPoint = 'https://www.thecocktaildb.com/api/json/v1/1/';
}

enum EnvType { DEV, STAGING, PROD }