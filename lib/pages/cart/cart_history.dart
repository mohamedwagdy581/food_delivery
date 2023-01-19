import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:intl/intl.dart';

import '../../models/cart_model.dart';
import '../../widgets/small_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemPerOrder = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;
    Widget timeWidget(int index)
    {
      var outputDate = DateTime.now().toString();
      if(index< getCartHistoryList.length)
      {
        DateTime parseDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(
            getCartHistoryList[listCounter].time!);
        var inputDate =
        DateTime.parse(parseDate.toString());
        var outputFormat =
        DateFormat("MM/dd/yyyy hh:mm a");
        outputDate = outputFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: Dimensions.pageViewTextContainer,
            padding: EdgeInsets.only(
              top: Dimensions.height45,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: 'Cart History',
                  color: AppColors.buttonBackgroundColor,
                  size: Dimensions.font26,
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.buttonBackgroundColor,
                  size: Dimensions.iconSize26,
                ),
              ],
            ),
          ),
          // Body
          GetBuilder<CartController>(builder: (_cartController)
          {
            var cartLength = _cartController.getCartHistoryList();
            return cartLength.isNotEmpty
                ? Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      for (int i = 0; i < itemsPerOrder.length; i++)
                        Container(
                          height: Dimensions.pageViewTextContainer,
                          margin: EdgeInsets.only(bottom: Dimensions.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              timeWidget(listCounter),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children:
                                    List.generate(itemsPerOrder[i], (index) {
                                      if (listCounter <
                                          getCartHistoryList.length) {
                                        listCounter++;
                                      }
                                      return index <= 2
                                          ? Container(
                                        height: Dimensions.cartHistory,
                                        width: Dimensions.cartHistory,
                                        margin: EdgeInsets.only(
                                            right: Dimensions.width10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                Dimensions.radius15 /
                                                    2),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants
                                                        .UPLOAD_URL +
                                                    getCartHistoryList[
                                                    listCounter - 1]
                                                        .img!,
                                              ),
                                            )),
                                      )
                                          : Container();
                                    }),
                                  ),
                                  SizedBox(
                                    height: Dimensions.cartHistory,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SmallText(
                                          text: 'Total',
                                          color: AppColors.titleColor,
                                        ),
                                        BigText(
                                          text: "${itemsPerOrder[i]} Items",
                                          color: AppColors.titleColor,
                                        ),
                                        GestureDetector(
                                          onTap: ()
                                          {
                                            var orderTime = cartOrderTimeToList();
                                            Map<int, CartModel> moreOrder ={};
                                            for(int j = 0; j < getCartHistoryList.length; j++)
                                            {
                                              if(getCartHistoryList[j].time == orderTime[i])
                                              {
                                                moreOrder.putIfAbsent(getCartHistoryList[j].id!, () => CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j]))));
                                              }
                                            }
                                            Get.find<CartController>().setItems = moreOrder;
                                            Get.find<CartController>().addToCartList();
                                            Get.toNamed(RouteHelper.getCartPage());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.width10,
                                              vertical: Dimensions.width10 / 2,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.radius15 / 3),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.mainColor),
                                            ),
                                            child: SmallText(
                                              text: 'One more',
                                              color: AppColors.mainColor,
                                            ),
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
                    ],
                  ),
                ),
              ),
            ) 
                : SizedBox(
                height: MediaQuery.of(context).size.height/1.5,
                child: const NoDataPage(text: "You didn't buy anything so far !", imgPath: 'assets/images/empty_box.webp',));
          }),
        ],
      ),
    );

  }
}
