import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';

import '../../widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Profile',
          size: 24,
          color: AppColors.buttonBackgroundColor,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            // Profile Icon
            AppIcon(
              onTap: () {},
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: AppColors.buttonBackgroundColor,
              iconSize: Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(height: Dimensions.height30,),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Name
                    AccountWidget(
                      bigText: BigText(
                        text: 'Mohamed',
                      ),
                      appIcon: AppIcon(
                        onTap: () {},
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: AppColors.buttonBackgroundColor,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height30,),

                    // Phone
                    AccountWidget(
                      bigText: BigText(
                        text: '00966540814455',
                      ),
                      appIcon: AppIcon(
                        onTap: () {},
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: AppColors.buttonBackgroundColor,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height30,),
                    // Email
                    AccountWidget(
                      bigText: BigText(
                        text: 'mohamedwagdy4153@gmail.com',
                      ),
                      appIcon: AppIcon(
                        onTap: () {},
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: AppColors.buttonBackgroundColor,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height30,),

                    // Address
                    AccountWidget(
                      bigText: BigText(
                        text: 'Fill in your address',
                      ),
                      appIcon: AppIcon(
                        onTap: () {},
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: AppColors.buttonBackgroundColor,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height30,),

                    // Message
                    AccountWidget(
                      bigText: BigText(
                        text: 'Mohamed',
                      ),
                      appIcon: AppIcon(
                        onTap: () {},
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: AppColors.buttonBackgroundColor,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
