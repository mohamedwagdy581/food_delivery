import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';
import '../../widgets/big_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async
  {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    print('The Height is ${MediaQuery.of(context).size.height}');
    print('The Width is ${MediaQuery.of(context).size.width}');
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadResource,
        child: SafeArea(
          child: ListView(
            children: [
              //Upper Country and search section
              Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                ),
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: 'Egypt',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'Cairo',
                              color: Colors.black54,
                            ),
                            const Icon(
                              Icons.arrow_drop_down_rounded,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // The Body of Main Food Page
              const FoodPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}
