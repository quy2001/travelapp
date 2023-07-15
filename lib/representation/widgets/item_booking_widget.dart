import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/core/helpers/image_helper.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget({super.key,required this.icon ,required this.title, required this.description, this.onTap});

  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(kItemPadding),
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                ImageHelper.loadFromAsset(icon,width: 40,height: 40),
                SizedBox(width: kItemPadding*2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(title,),
                    SizedBox(height: kItemPadding),
                    Text(description,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
