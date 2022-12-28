import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  onTap: () {},
                  icon: Icons.clear,
                ),
                AppIcon(
                  onTap: () {},
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://img.freepik.com/free-photo/traditional-azerbaijani-dish-served-with-yogurt-olives_114579-4520.jpg?t=st=1672036924~exp=1672037524~hmac=96ba9a0bdf70295c60deab9403dc39e5e6989d870fcf43c915fee88be65078a6',
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
                  text: 'Chinese Side',
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
                  child: const ExpandableTextWidget(
                    text:
                        'After whole month cooking big arabic meals for Ramadan, we need a break. Kids loved having burgers for breaking the fast as a change.After whole month cooking big arabic meals for Ramadan, we need a break. Kids loved having burgers for breaking the fast as a change.After whole month cooking big arabic meals for Ramadan, we need a break. Kids loved having burgers for breaking the fast as a change.After whole month cooking big arabic meals for Ramadan, we need a break. Kids loved having burgers for breaking the fast as a change.After whole month cooking big arabic meals for Ramadan, we need a break. Kids loved having burgers for breaking the fast as a change.After whole month cooking big arabic meals for Ramadan, we need a break. Kids loved having burgers for breaking the fast as a change.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
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
                  onTap: () {},
                  icon: Icons.remove,
                  iconSize: Dimensions.iconSize26,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: '\$12.88 ' + 'X  '+ '0',
                  //color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  onTap: () {},
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
        ],
      ),
    );
  }
}
