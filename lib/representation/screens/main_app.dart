import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travelapp/core/constants/color_constants.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/representation/screens/home_screen.dart';
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static const routeName = 'main_app';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          Container(color: Colors.blue,),
          Container(color: Colors.brown,),
          Container(color: Colors.yellow,),
        ],
      ),
      //sử dụng thư viên SalomonBottomBar cho bottombar
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
          margin: EdgeInsets.symmetric(horizontal: kMediumPadding,vertical: kDefaultPadding),
          items: [
            SalomonBottomBarItem(
                icon: Icon(
                    Icons.home,
                  size: kDefaultIconSize,
                ),
                title: Text('Home')
            ),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: kDefaultIconSize,
                ),
                title: Text('Like')
            ),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.book,
                  size: kDefaultIconSize,
                ),
                title: Text('Booking')
            ),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.supervised_user_circle_rounded,
                  size: kDefaultIconSize,
                ),
                title: Text('Profile')
            ),
          ],
    ),
    );
  }
}
