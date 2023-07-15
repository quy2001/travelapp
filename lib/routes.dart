import 'package:flutter/material.dart';
import 'package:travelapp/representation/screens/guest_room_screen.dart';
import 'package:travelapp/representation/screens/hotel_booking_screen.dart';
import 'package:travelapp/representation/screens/hotel_detail_screen.dart';
import 'package:travelapp/representation/screens/hotels_screen.dart';
import 'package:travelapp/representation/screens/intro_screen.dart';
import 'package:travelapp/representation/screens/main_app.dart';
import 'package:travelapp/representation/screens/select_date_screen.dart';
import 'package:travelapp/representation/screens/splash_screen.dart';

import 'data/models/hotel_model.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelsScreen.routeName: (context) => const HotelsScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  AddGuestRoomScreen.routeName: (context) => AddGuestRoomScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelDetailScreen(
          hotelModel: hotelModel,
        ),
      );
    default:
      return null;
  }
}