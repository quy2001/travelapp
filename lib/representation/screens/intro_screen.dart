import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/core/helpers/asset_helper.dart';
import 'package:travelapp/core/helpers/image_helper.dart';
import 'package:travelapp/representation/screens/main_app.dart';
import 'package:travelapp/representation/widgets/button_widget.dart';

import '../../core/constants/textstyle_constants.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
 static const routeName ='/intro_screen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  //khởi tạo chiều lướt
  final PageController _pageController = PageController();
  //khai báo streams để đánh dấu trang
  final StreamController<int> _pageStreamController = StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print(_pageController.page);
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }
  //tạo widget dùng chung cho các trang intro
  //nên truyền các biến(param) vào hàm để tái sử dụng
  Widget _buildItemIntroScreen(String image, String title, String description,AlignmentGeometry aligment){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //truyền vào aligment để xét vị trí
          alignment: aligment,
          child: ImageHelper.loadFromAsset(image,
          height: 400,
          fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          //kMediumPadding là biến được định nghĩa trong hàm dismension_constants
          height: kMediumPadding*2,
        ),
        Padding(padding: const EdgeInsets.symmetric(
          horizontal: kMediumPadding,
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyles.defaultStyle.bold,),
              const SizedBox(
                //kMediumPadding là biến được định nghĩa trong hàm dismension_constants
                height: kMediumPadding,
              ),
              Text(description,style: TextStyles.defaultStyle,),
            ],
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [PageView(
          controller: _pageController,
          children: [
              //gọi hàm trên
            _buildItemIntroScreen(AssetHelper.intro1,
                'Book a flight',
                'Found a flight that matches your destinationand schedule? Book it instantly.',
                Alignment.centerRight,
            ),
            _buildItemIntroScreen(AssetHelper.intro2,
              'Find a hotel room',
              'Select the day, book your room. We give you the best price.',
              Alignment.center,
            ),
            _buildItemIntroScreen(AssetHelper.intro3,
              'Enjoy your trip',
              'Easy discovering new places and share these between your friends and travel together.',
              Alignment.centerLeft,
            ),
          ],
        ),
          //cho nổi slider trên cái page view
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding*3,
            child: Row(
            children: [
              Expanded(
                //sử dụng thư viên tạo slider
                flex: 6,
                child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotWidth: kMinPadding,
                  dotHeight: kMinPadding,
                  activeDotColor: Colors.orange,
                ),
              ),
              ),
              StreamBuilder<int>(
                initialData: 0,//giá trị đầu tiên
                stream: _pageStreamController.stream,
                builder: (context, snapshot) {
                  return Expanded(
                    flex: 4,
                    child: ButtonWidget(
                      title: snapshot.data !=2 ?'Next' : 'Get started',
                      ontap: (){
                        if(_pageController.page !=2){
                          _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                        }else{
                          Navigator.of(context).pushNamed(MainApp.routeName);
                        }
                      },),
                  );
                }
              ),
            ],
          ),),
        ],
      ),
    );
  }
}
