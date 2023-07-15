import 'package:flutter/material.dart';
import 'package:travelapp/core/helpers/asset_helper.dart';
import 'package:travelapp/core/helpers/image_helper.dart';
import 'package:travelapp/representation/screens/intro_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName='/splash_screen';//chỉ cần gọi đến routerName để chuyển tab

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }
  //hàm chuyển trang intro
  void redirectIntroScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushNamed(IntroScreen.routeName);//chuyển hướng sang trang intro
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.imageBackGroundSplash,fit: BoxFit.fitWidth),
        ),
        Positioned.fill(child:ImageHelper.loadFromAsset(AssetHelper.imageCircleSplash,)
       )
      ],
    );
  }
}
