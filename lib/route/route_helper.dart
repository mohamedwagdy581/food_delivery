import 'package:food_delivery/pages/food/recommended_food_details.dart';
import 'package:get/get.dart';

import '../pages/food/popular_food_details.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const popularFood = '/popular-food';
  static const recommendedFood = '/recommended-food';

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> route = [
    GetPage(name: initial, page: () => const MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetails(pageId: int.parse(pageId!),);
        },
      transition: Transition.fadeIn,
    ),

    // Recommended Page Route
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetails(pageId: int.parse(pageId!),);
      },
      transition: Transition.fadeIn,
    ),
  ];
}
