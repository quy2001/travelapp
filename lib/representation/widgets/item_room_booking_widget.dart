import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/core/helpers/image_helper.dart';
import 'package:travelapp/data/models/room_model.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/textstyle_constants.dart';
import '../screens/check_out_screen.dart';
import 'button_widget.dart';
import 'dashline_widget.dart';
import 'item_untility_hotel_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget({super.key, required this.roomModel, this.onTap, this.numberOfRoom});

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kMediumPadding),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(roomModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(height: kMinPadding,),
                    Text('Room size: ${roomModel.size} m2',
                    maxLines: 2,
                    ),
                    SizedBox(height: kMinPadding,),
                    Text(roomModel.utility),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPadding,),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromAsset(roomModel.roomImage,
                radius: BorderRadius.all(
                    Radius.circular(kItemPadding)
                   ),
                ),
              ),
            ],
          ),
          ItemUntilityHotelWidget(),
          DashLineWidget(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      '\$${roomModel.price.toString()}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kMinPadding,
                    ),
                    Text('/night',
                      style: TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   flex: 3,
              //   child: ButtonWidget(
              //       title: 'Choose',
              //       ontap: onTap,
              //   ),
              // ),
              Expanded(
                child: numberOfRoom == null
                    ? ButtonWidget(
                  title: 'Choose',
                  ontap: onTap,
                )
                    : Text(
                  '$numberOfRoom room',
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
