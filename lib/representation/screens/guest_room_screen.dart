import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/representation/widgets/app_bar_container.dart';
import 'package:travelapp/representation/widgets/button_widget.dart';

import '../../core/helpers/asset_helper.dart';
import '../widgets/item_guest_room.dart';

class AddGuestRoomScreen extends StatefulWidget {
  const AddGuestRoomScreen({super.key});

  static const String routeName='/guest_room_screen';

  @override
  State<AddGuestRoomScreen> createState() => _AddGuestRoomScreenState();
}

class _AddGuestRoomScreenState extends State<AddGuestRoomScreen> {

 final GlobalKey<ItemAddGuestAndRoomState> _itemCountGuest=GlobalKey<ItemAddGuestAndRoomState>();
 final GlobalKey<ItemAddGuestAndRoomState> _itemCountRoom=GlobalKey<ItemAddGuestAndRoomState>();
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        tittleString: 'Add guest and room',
        child: Column(
          children: [
            SizedBox(height: kMediumPadding*3,),
            ItemAddGuestAndRoom(
                key: _itemCountGuest,
                title: 'Guest',
                icon: AssetHelper.icoGuest,
                innitData: 1,
            ),
            ItemAddGuestAndRoom(
                key: _itemCountRoom,
                title: 'Room',
                icon: AssetHelper.icoRoom,
                innitData: 1,
               ),
            ButtonWidget(
                title: 'Done',
                ontap: (){
                Navigator.of(context).pop([
                  _itemCountGuest.currentState!.number,
                  _itemCountRoom.currentState!.number,
                ]);
            }),
          ],
        ));
  }
}
