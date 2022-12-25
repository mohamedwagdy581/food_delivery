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
  static double height10 = screenHeight / 93.2;
  static double height15 = screenHeight / 67.6;
  static double height20 = screenHeight / 46.6;
  static double height30 = screenHeight / 31.066;
  static double height45 = screenHeight / 20.71;

  // Font Size
  static double font20 = screenHeight / 46.6;

  // Radius
  static double radius5 = screenHeight / 186.4;
  static double radius10 = screenHeight / 93.2;
  static double radius15 = screenHeight / 62.133;
  static double radius20 = screenHeight / 46.6;
  static double radius30 = screenHeight / 31.066;

  // Icons Size
  static double iconSize24 = screenHeight / 38.833;
  // Dynamic Width
// Sized Box Width for padding and margin
  static double width10 = screenHeight / 93.2;
  static double width15 = screenHeight / 62.133;
  static double width20 = screenHeight / 46.6;
  static double width30 = screenHeight / 31.066;
  static double width45 = screenHeight / 20.71;
}