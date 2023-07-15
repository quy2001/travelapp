import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/color_constants.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/core/helpers/image_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/data/models/hotel_model.dart';
import 'package:travelapp/representation/widgets/button_widget.dart';
import 'package:travelapp/representation/widgets/dashline_widget.dart';

import '../../core/helpers/asset_helper.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotelModel});

  static const String routeName='/hotel_detail_screen';

  final HotelModel hotelModel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //để ảnh full màn hình
          Positioned.fill(
              child: ImageHelper.loadFromAsset(
                AssetHelper.imageHotelDetail,
                fit: BoxFit.fill,
              )),
          Positioned(
            top: kMediumPadding*3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                //color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          kDefaultPadding
                      ),
                    ),
                    color: Colors.white
                ),
                child: Icon(FontAwesomeIcons.arrowLeft),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding*3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                //color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          kDefaultPadding
                      ),
                    ),
                    color: Colors.white
                ),
                child: Icon(FontAwesomeIcons.solidHeart,color: Colors.redAccent,),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
              maxChildSize: 0.8,
              minChildSize: 0.3,
              builder: (context,scrollController){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding*2),
                      topRight: Radius.circular(kDefaultPadding*2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: kDefaultPadding),
                        child: Container(
                          height: 5,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(kItemPadding
                                ),
                            ),
                            color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      Expanded(
                        child: ListView(
                            controller: scrollController,
                          children: [
                            Row(
                              children: [
                                Text(
                                    widget.hotelModel.hotelName,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                ),
                                Spacer(),
                                Text('\$${widget.hotelModel.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(' /night'),

                              ],
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Row(
                              children: [
                                ImageHelper.loadFromAsset(AssetHelper.icoLocationHotel),
                                SizedBox(width: kMinPadding,),
                                Text(widget.hotelModel.location),
                              ],
                            ),
                            DashLineWidget(),
                            Row(
                              children: [
                                ImageHelper.loadFromAsset(AssetHelper.icoStarHotel),
                                SizedBox(width: kMinPadding,),
                                Text('${widget.hotelModel.star}/5'),
                                Text(' (${widget.hotelModel.numberOfReview})',style: TextStyle(color: ColorPalette.subTitleColor),),
                              ],
                            ),
                            DashLineWidget(),
                            Text('Infromation',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: kDefaultPadding,),
                            Text('You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.',
                            ),
                            SizedBox(height: kDefaultPadding,),
                            Text('Location',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: kDefaultPadding,),
                            Text('Located in the famous neighborhood of Seoul,Grand Luxury’s is set in a building built in the 2010s.',
                            ),
                            SizedBox(height: kDefaultPadding,),
                            ImageHelper.loadFromAsset(AssetHelper.imageMap),
                            SizedBox(height: kDefaultPadding*2,),
                            ButtonWidget(title: 'SELECT ROOM', ontap: (){}),
                          ],
                       ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
