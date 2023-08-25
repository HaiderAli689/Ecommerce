
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/food/popular_food_details.dart';
import 'package:ecommerce/screens/home/main_food_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/food/recommende_food_details.dart';
import '../screens/home/home_screen.dart';
import '../screens/splash/splash_screen.dart';

class RouteHelper{

  static const String splashScreen ="/spalsh-screen";
  static const String initial ="/";
  static const String popularFood = "/popular-food";
  static String reommendedrFood = "/recommended-food";
  static String cartPage = "/cart-page";

  static String getpopularFood(int pageId, /*String page*/) => "$popularFood?pageId = $pageId"; //$page = page"
  static String getRecommendedFood() => "$reommendedrFood";
  static String getInitial() => '$initial';
  static String getCartPage() => '$cartPage';
  static String getSplashScreen() => '$splashScreen';

  static List<GetPage> routes =[

    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(name: popularFood, page: () {

      var pageId = Get.parameters['pageId'];
      //var page = Get.parameters['page'];
     return PopularFoodDetails(/*pageId:int.parse(pageId!)*/ /*page:page!*/);
  },

      transition: Transition.fadeIn
    ),GetPage(name: reommendedrFood, page: () {

     return RecommmendedFoodDetails();
  },

      transition: Transition.fadeIn
    ),

    GetPage(name: cartPage, page: (){
      return CartScreen();
    },
    transition: Transition.fadeIn)
  ];
}