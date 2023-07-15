import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/core/helpers/asset_helper.dart';
import 'package:travelapp/core/extensions/date_ext.dart';
import 'package:travelapp/representation/screens/guest_room_screen.dart';
import 'package:travelapp/representation/screens/select_date_screen.dart';
import 'package:travelapp/representation/widgets/app_bar_container.dart';
import 'package:travelapp/representation/widgets/item_booking_widget.dart';

import '../widgets/button_widget.dart';
import 'hotels_screen.dart';
class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, required this.destination});
  static const String routeName='/hotel_booking_screen';
  final String destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  String? guestAndRoom;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        tittleString: 'Hotel Booking',
      child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: kMediumPadding*2,),
              ItemBookingWidget(onTap: (){},icon: AssetHelper.icoLocation, title: 'Destination', description: widget.destination),
              SizedBox(height: kMediumPadding*2,),
              ItemBookingWidget(
                  icon: AssetHelper.icoDate,
                  title: 'Select Date',
                  description: dateSelected?? '13 Feb - 18 Feb 2021',//nếu bằng null hiện ra giá trị mặc định
                  onTap: () async {
                  final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                  if(!(result as List<DateTime?>).any((element) => element==null)){
                  dateSelected='${result[0]?.getStartDate}-${result[1]?.getEndDate}';
                  setState(() {
                    });
                    }
                    },
              ),
              SizedBox(height: kMediumPadding*2,),
              ItemBookingWidget(
                  icon: AssetHelper.icoGuestRoom,
                  title: 'Guest and Room',
                  description: guestAndRoom?? '2 Guest, 1 Room',
                onTap: () async {
                 final result = await Navigator.of(context).pushNamed(AddGuestRoomScreen.routeName);
                 if (result is List<int>) {
                   setState(() {
                     guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                   });
                 }
                },
              ),
              SizedBox(height: kDefaultPadding*2,),
              ButtonWidget(
                title: 'Search',
                ontap: (){
                  Navigator.of(context).pushNamed(HotelsScreen.routeName);
                },),
              SizedBox(height: kDefaultPadding*2,),
              ButtonWidget(title: 'Home',ontap: (){
                Navigator.of(context).pop();
              },),
            ],
          ),
      ),
    );
  }
}
