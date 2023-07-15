import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/core/helpers/image_helper.dart';
import 'package:travelapp/data/models/room_model.dart';
import '../../core/constants/color_constants.dart';
import '../screens/splash_screen.dart';
import 'button_widget.dart';
import 'item_untility_hotel_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget({super.key, required this.roomModel});

  final RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kItemPadding),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(roomModel.roomName),
                  SizedBox(height: kMinPadding,),
                  Text('Room size: ${roomModel.size.toString()} m2'),
                  SizedBox(height: kMinPadding,),
                  Text(roomModel.utility),
                ],
              ),
              SizedBox(width: kDefaultPadding,),
              ImageHelper.loadFromAsset(roomModel.roomImage,
              radius: BorderRadius.all(
                  Radius.circular(kMinPadding)
                 ),
              ),
            ],
          ),
          ItemUntilityHotelWidget(),
          SplashScreen(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('\$4.5}',
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
                    title: 'Choose',
                    ontap: (){
                    }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
