import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/core/helpers/asset_helper.dart';
import 'package:travelapp/core/helpers/image_helper.dart';
import '../../core/constants/color_constants.dart';
import '../widgets/app_bar_container.dart';
import 'hotel_booking_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //viết hàm dùng chung cho 3 cái ô vuông
  Widget _builtItemCategory(Widget icon, Color color, Function() onTap, String title){
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: kMediumPadding
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding),
            ),
            child: icon,
          ),
          SizedBox(height: kItemPadding,),
          Text(title),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      // tittleString: 'Home',
      // implementLeading: true,
      // implementTraling: true,
      tittle: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding,
        ),
        child: Row(
          children:[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Hi Quy!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next?',
                  style: TextStyle(
                      fontSize: 12,
                  ),
                )
              ],
            ),
            //dùng để giàn trải ra 2 bến
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(
              width: kMinPadding*2,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  kItemPadding,
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(kMinPadding),
              child: ImageHelper.loadFromAsset(AssetHelper.preson),
            ),
          ],
        ),
      ),
      child: Column(
            children:[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search your destination',
                  prefixIcon: Padding(
                    padding:  EdgeInsets.all(kTopPadding),
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.black,
                      size: kDefaultPadding,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                        Radius.circular(
                          kItemPadding
                        ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: kItemPadding,
                  ),
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                children: [
                  Expanded(
                      child: _builtItemCategory(
                          ImageHelper.loadFromAsset(AssetHelper.iconHotel,
                          width: kBottomBarIconSize,
                          height: kBottomBarIconSize,
                          ),
                          Color(0xffFE9C5E),
                              () {
                            Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                              },
                          'Hotels'),
                  ),
                  SizedBox(width: kDefaultPadding,),
                  Expanded(
                    child: _builtItemCategory(
                        ImageHelper.loadFromAsset(AssetHelper.iconPlane,
                          width: kBottomBarIconSize,
                          height: kBottomBarIconSize,
                        ),
                        Color(0xffF77777),
                            () {},
                        'Flights'),
                  ),
                  SizedBox(width: kDefaultPadding,),
                  Expanded(
                    child: _builtItemCategory(
                        ImageHelper.loadFromAsset(AssetHelper.iconHotelPlane,
                          width: kBottomBarIconSize,
                          height: kBottomBarIconSize,
                        ),
                        Color(0xff3EC8BC),
                            () {},
                        'All'),
                  ),
                ],
              ),
            ],
      ),
    );

  }
}
