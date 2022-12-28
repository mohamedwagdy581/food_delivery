import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppSmallDetailsColumn extends StatelessWidget {
  final String text;
  final double textSize;
  final double rating;
  final double comments;
  final double time;
  final double distance;
  const AppSmallDetailsColumn({
    Key? key,
    required this.text,
    this.textSize = 0,
    this.rating = 4.5,
    this.comments = 1287,
    this.time = 32,
    this.distance = 1.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: textSize ==0? Dimensions.font20 : textSize,
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
              text: '$rating',
            ),
            SizedBox(
              width: Dimensions.width15,
            ),
            SmallText(
              text: '$comments',
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
              text: '$distance km',
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              iconColor: AppColors.iconColor2,
              text: '$time min',
            ),
          ],
        ),
      ],
    );
  }
}
