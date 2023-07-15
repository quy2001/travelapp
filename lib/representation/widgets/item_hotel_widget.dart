import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/color_constants.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/core/helpers/asset_helper.dart';
import 'package:travelapp/core/helpers/image_helper.dart';
import 'package:travelapp/data/models/hotel_model.dart';
import 'package:travelapp/representation/widgets/button_widget.dart';
import 'package:travelapp/representation/widgets/dashline_widget.dart';

import '../screens/hotel_detail_screen.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({super.key, required this.hotelModel});

  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(hotelModel.hotelImage,
            radius: BorderRadius.only(
              topLeft: Radius.circular(kDefaultPadding),
              bottomRight: Radius.circular(kDefaultPadding),
            )
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding,
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hotelModel.hotelName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoLocationHotel),
                    SizedBox(width: kMinPadding,),
                    Text(hotelModel.location),
                    Text('- ${hotelModel.awayKilometer} form destination',
                    style:
                      TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoStarHotel),
                    SizedBox(width: kMinPadding,),
                    Text(hotelModel.star.toString()),
                    Text('- ${hotelModel.numberOfReview} reviews',
                      style:
                      TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                    ),
                  ],
                ),
                DashLineWidget(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$${hotelModel.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text('/night',
                            style: TextStyle(
                              color: ColorPalette.subTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ButtonWidget(
                          title: 'Book a room',
                          ontap: (){
                            Navigator.of(context).pushNamed(HotelDetailScreen.routeName,arguments: hotelModel);
                          }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
