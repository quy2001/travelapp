import 'package:flutter/material.dart';
import 'package:travelapp/data/models/room_model.dart';
import 'package:travelapp/representation/widgets/app_bar_container.dart';

import '../../core/helpers/asset_helper.dart';
import '../widgets/item_room_booking_widget.dart';
import 'check_out_screen.dart';
class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key});

  static const routeName='/select_room_screen';

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {

  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.imageRoom1,
      roomName: 'Deluxe Room',
      utility: 'Free Cancellation',
      size: 27,
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.imageRoom2,
      roomName: 'Executive Suite',
      utility: 'Non-refundable',
      size: 32,
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.imageRoom3,
      roomName: 'King Bed Only Room',
      utility: 'Non-refundable',
      size: 24,
      price: 214,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        tittleString: 'Select room',
        child: SingleChildScrollView(
          child: Column(
            children: listRoom.map((e) => ItemRoomBookingWidget(roomModel: e,
              onTap: (){
                Navigator.of(context).pushNamed(CheckOutScreen.routeName,arguments: e);
              },
            )).toList(),
          ),
        ));;
  }
}
