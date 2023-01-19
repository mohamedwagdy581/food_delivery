import 'package:flutter/material.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:get/get.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../../route/route_helper.dart';
import '../../utils/app_constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  onTap: ()
                  {
                    Get.back();
                  },
                  icon: Icons.arrow_back_ios,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                AppIcon(
                  onTap: ()
                  {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  icon: Icons.home_outlined,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                AppIcon(
                  onTap: () {},
                  icon: Icons.shopping_cart,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          // Body
          GetBuilder<CartController>(builder: (_cartController)
          {
            if (_cartController.getItems.isNotEmpty) {
              return Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height20),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController)
                  {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: Dimensions.height20 * 5,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: ()
                                {
                                  var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].product!);
                                  if(popularIndex>=0)
                                  {
                                    Get.toNamed(RouteHelper.getPopularFood(popularIndex, 'cartpage'));
                                  }else
                                  {
                                    var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].product!);
                                    if(recommendedIndex<0)
                                    {
                                      Get.snackbar('History Product', "Product review is not available for history product", backgroundColor: AppColors.mainColor, colorText: Colors.white);

                                    }else
                                    {
                                      Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex,'cartpage'));
                                    }
                                  }
                                },
                                child: Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin:
                                  EdgeInsets.only(bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width10,),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height20*5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!,color: Colors.black,),
                                      SmallText(text: 'Spicy',),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: "\$ ${cartController.getItems[index].price!}", color: Colors.redAccent,),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height10 / 2,
                                              bottom: Dimensions.height10 / 2,
                                              right: Dimensions.width10 / 2,
                                              left: Dimensions.width10 / 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                Dimensions.radius20,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    cartController.addItem(_cartList[index].product!, -1);
                                                    //popularProduct.setQuantity(false);
                                                  },
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                BigText(text: _cartList[index].quantity.toString()),
                                                IconButton(
                                                  onPressed: () {
                                                    cartController.addItem(_cartList[index].product!, 1);
                                                    //popularProduct.setQuantity(true);
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            );
            } else {
              return const NoDataPage(text: 'Your cart is empty!');
            }
          },
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController)
      {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              child: cartController.getItems.isNotEmpty ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      right: Dimensions.width45,
                      left: Dimensions.width45,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius20,
                      ),
                    ),
                    child: BigText(text:"\$ ${cartController.totalAmount}"),
                  ),
                  GestureDetector(
                    onTap: () {
                      //controller.addItem(product);
                      print("tapped");
                      cartController.addToHistory();
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        right: Dimensions.width30,
                        left: Dimensions.width30,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                      ),
                      child: BigText(
                        text: 'Check Out',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ): Container(),
            ),
          ],
        );
      }),
    );
  }
}
