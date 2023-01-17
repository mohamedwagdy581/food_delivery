import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../utils/app_constants.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetails({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  onTap: ()
                  {
                    if(page == 'cartpage')
                    {
                      Get.toNamed(RouteHelper.getCartPage());
                    }else
                    {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  icon: Icons.clear,
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      AppIcon(
                        onTap: ()
                        {
                          if(controller.totalItems>=1)
                          {
                            Get.toNamed(RouteHelper.getCartPage());
                          }else
                          {
                            Get.snackbar('Item Count', "You Should Add an Item at least !", backgroundColor: AppColors.mainColor, colorText: Colors.white);
                          }

                        },
                        icon: Icons.shopping_cart_outlined,
                      ),

                      // BackGround of Quantity Number
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                        right: 0,
                        top: 0,
                        child: AppIcon(
                          onTap: () {},
                          icon: Icons.circle,
                          size: 20,
                          iconColor: Colors.transparent,
                          backgroundColor: AppColors.mainColor,
                        ),
                      )
                          : Container(),

                      // Quantity Numbers
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                        right: 3,
                        top: 3,
                        child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                          size: 12.0,color: Colors.white,),
                      )
                          : Container(),
                    ],
                  );
                }),
              ],
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimensions.height5,
                  bottom: Dimensions.height10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        Dimensions.radius20,
                      ),
                      topLeft: Radius.circular(
                        Dimensions.radius20,
                      ),
                    )),
                child: BigText(
                  text: product.name!,
                  size: Dimensions.font26,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableTextWidget(
                    text: product.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller)
      {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppIcon(
                    onTap: ()
                    {
                      controller.setQuantity(false);
                    },
                    icon: Icons.remove,
                    iconSize: Dimensions.iconSize26,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                  BigText(
                    text: '\$ ${product.price!} X  ${controller.inCartItems.toString()}',
                    //color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  AppIcon(
                    onTap: ()
                    {
                      controller.setQuantity(true);
                    },
                    icon: Icons.add,
                    iconSize: Dimensions.iconSize26,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomNavBarHeight,
              padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width30,
                right: Dimensions.width30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    Dimensions.radius20 * 2,
                  ),
                  topLeft: Radius.circular(
                    Dimensions.radius20 * 2,
                  ),
                ),
                color: AppColors.buttonBackgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      right: Dimensions.width20,
                      left: Dimensions.width20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius20,
                      ),
                    ),
                    child: Icon(Icons.favorite, color: AppColors.mainColor, size: Dimensions.iconSize26,),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        right: Dimensions.width20,
                        left: Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                      ),
                      child: BigText(
                        text: '\$ ${product.price!} | Add to Cart',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
