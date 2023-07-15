import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/color_constants.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/core/constants/textstyle_constants.dart';

//tạo button dùng chung cho cả app
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, required this.ontap});
  //khai báo biến xong phải định nghĩa

  final String title;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            gradient: Gradients.defaultGradientBackground,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyles.defaultStyle.bold.whiteTextColor,
          ),
      ),
    );
  }
}
