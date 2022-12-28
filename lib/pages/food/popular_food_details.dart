import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/small_details_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';

import '../../utils/colors.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Food Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/traditional-azerbaijani-dish-served-with-yogurt-olives_114579-4520.jpg?t=st=1672036924~exp=1672037524~hmac=96ba9a0bdf70295c60deab9403dc39e5e6989d870fcf43c915fee88be65078a6',
                  ),
                ),
              ),
            ),
          ),
          // Back and add to cart Buttons
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  onTap: () {},
                  icon: Icons.arrow_back_ios,
                ),
                AppIcon(
                  onTap: () {},
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),
          // Food Details Container
          Positioned(
            top: Dimensions.popularFoodImgSize - Dimensions.height20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    Dimensions.radius20,
                  ),
                  topLeft: Radius.circular(
                    Dimensions.radius20,
                  ),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSmallDetailsColumn(
                    text: 'Burger',
                    textSize: Dimensions.font26,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: 'Introduce',
                    size: Dimensions.font26,
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text:
                            'After whole month cooking big arabic meals for Ramadan, we need a break. Kids loved having burgers for breaking the fast as a change.After whole month cooking big arabic meals for Ramadan, we need a break. Kids loved having burgers for breaking the fast as a change.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomNavBarHeight,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  BigText(text: '0'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                text: '\$10 | Add to Cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
