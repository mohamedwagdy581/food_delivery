import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _pageViewheight = Dimensions.pageView;
  double _pageViewContainerheight = Dimensions.pageViewContainer;
  double _pageViewTextheight = Dimensions.pageViewTextContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider Section
        Container(
          height: _pageViewheight,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        // Dots
        DotsIndicator(
          dotsCount: 5,
          position: currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius5)),
          ),
        ),
        // Popular Text
        SizedBox(width: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular',),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: '.',color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food Pairing',),
              ),
            ],
          ),
        ),
        // Some Food images and small details
        SizedBox(
          height: Dimensions.height15,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
            itemBuilder: (context, index)
        {
          return Container(
            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height15,),
            child: Row(
              children: [
                // Image Section
                Container(
                  height: Dimensions.listViewImgSize,
                  width: Dimensions.listViewImgSize,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/traditional-azerbaijani-dish-served-with-yogurt-olives_114579-4520.jpg?t=st=1672036924~exp=1672037524~hmac=96ba9a0bdf70295c60deab9403dc39e5e6989d870fcf43c915fee88be65078a6',
                      ),
                    ),
                  ),
                ),

                // Text Container Section
                Expanded(
                  child: Container(
                    height: Dimensions.listViewTextContSize,
                    padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        bottomRight: Radius.circular(Dimensions.radius20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: 'Nutritious Fruit Meal in China',),
                        SizedBox(height: Dimensions.height10,),
                        SmallText(text: 'With chinese characteristics'),
                        SizedBox(height: Dimensions.height10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              iconColor: AppColors.iconColor1,
                              text: 'Normal',
                            ),
                            IconAndTextWidget(
                              icon: Icons.location_on,
                              iconColor: AppColors.mainColor,
                              text: '1.7km',
                            ),
                            IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              iconColor: AppColors.iconColor2,
                              text: '32min',
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
        }),

      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentPageValue.floor()) {
      var currScale = 1 - (currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _pageViewContainerheight * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _pageViewContainerheight * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPageValue.floor() - 1) {
      var currScale = 1 - (currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _pageViewContainerheight * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _pageViewContainerheight * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _pageViewContainerheight,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://img.freepik.com/free-photo/hamburger-with-beef-meat-burger-fresh-vegetables-dark-surface_2829-5883.jpg?t=st=1671868547~exp=1671869147~hmac=88bd3bc5cd4e627ac20e2cbf9477f6d580ab7666d6ddb47e35b3c60e2be7ec6c',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: _pageViewTextheight,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFe8e8e8),
                    blurRadius: Dimensions.radius5,
                    offset: const Offset(0, 5),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15, bottom: Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Egyptian Side',
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(
                          text: '4.5',
                        ),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                        SmallText(
                          text: '1287',
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(
                          text: 'Comments',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          iconColor: AppColors.iconColor1,
                          text: 'Normal',
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          text: '1.7km',
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          iconColor: AppColors.iconColor2,
                          text: '32min',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
