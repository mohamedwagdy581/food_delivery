import 'package:get/get.dart';
class Dimensions
{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
// to get the device height and width we should print them and make a calculation (height / the Container Height)
  // Dynamic Height
  static double pageView = screenHeight / 2.9125;
  static double pageViewContainer = screenHeight / 4.236;
  static double pageViewTextContainer = screenHeight / 7.76;

  // Sized Box Height for padding and margin
  static double height5 = screenHeight / 186.4;
  static double height10 = screenHeight / 93.2;
  static double height15 = screenHeight / 67.6;
  static double height20 = screenHeight / 46.6;
  static double height30 = screenHeight / 31.066;
  static double height45 = screenHeight / 20.71;

  // Font Size
  static double font16 = screenHeight / 58.25;
  static double font20 = screenHeight / 46.6;
  static double font26 = screenHeight / 35.846;

  // Radius
  static double radius5 = screenHeight / 186.4;
  static double radius10 = screenHeight / 93.2;
  static double radius15 = screenHeight / 62.133;
  static double radius20 = screenHeight / 46.6;
  static double radius30 = screenHeight / 31.066;

  // Icons Size
  static double iconSize24 = screenHeight / 38.833;
  static double iconSize26 = screenHeight / 35.846;
  static double iconSize18 = screenHeight / 51.8;
  // Dynamic Width
// Sized Box Width for padding and margin
  static double width5 = screenHeight / 186.4;
  static double width10 = screenHeight / 93.2;
  static double width15 = screenHeight / 62.133;
  static double width20 = screenHeight / 46.6;
  static double width30 = screenHeight / 31.066;
  static double width45 = screenHeight / 20.71;

  // ListView Size
  static double listViewImgSize = screenWidth / 3.583;
  static double listViewTextContSize = screenWidth / 4.3;

  // Popular Food Size
  static double popularFoodImgSize = screenHeight / 3.11;

  // BottomNavBar Size
  static double bottomNavBarHeight = screenHeight / 7.77;
}