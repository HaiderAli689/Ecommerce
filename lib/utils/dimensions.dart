


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Dimensions{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight/3.84;
  static double pageView = screenHeight/2.64;
  static double pageViewTextContainer = screenHeight/7.03;

  //Dynamic Height also to padding and margin
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.27;
  static double height20 = screenHeight/42.2;
  static double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.76;

  //Dynamic Width also to padding and margin
  static double width10 = screenHeight/84.4;
  static double width15 = screenHeight/56.27;
  static double width20 = screenHeight/42.2;
  static double width30 = screenHeight/28.13;
  static double width45 = screenHeight/18.76;

  //Font Size
  static double font16 = screenHeight/52.75;
  static double font20 = screenHeight/42.2;
  static double font26 = screenHeight/32.46;

  static double radius15 = screenHeight/56.27;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  static double icon24 = screenHeight/35.7;
  static double icon16 = screenHeight/52.75;

  //ListView Images Size
  static double listViewImageSize = screenWidth/3.25;
  static double listViewTextContSize = screenWidth/3.9;

  //Popular food images
  static double popularFoodImages = screenHeight/2.41;

  //Bottom height
  static double bottomHeightBar = screenHeight/7.03;

  //Splash Screen
  static double splashImg = screenHeight/3.38;
}