import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/color_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constants/dismension_constants.dart';
class AppBarContainerWidget extends StatelessWidget {
  const AppBarContainerWidget({super.key , required this.child, this.tittle,this.implementLeading=true, this.tittleString,this.implementTraling=false });
  final Widget child;
  final Widget? tittle;
  final String? tittleString;
  final bool implementLeading;//nút button
  final bool implementTraling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              title: tittle??
              Row(
                children: [
                  if(implementLeading)
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
                          child: Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,),
                        ),
                      ),
                    ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(kDefaultPadding),
                      //     ),
                      //     color: Colors.white,
                      //   ),
                      //   padding: EdgeInsets.all(kItemPadding),
                      //   child: Icon(
                      //     Icons.arrow_back,
                      //     size: kDefaultIconSize,
                      //     color: Colors.black,
                      //   ),
                      // ),
                  Expanded(
                      child: Center(
                        child: Column(
                        children: [
                          Text(tittleString ?? '',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                    ),
                  ),
                  ),
                  if(implementTraling)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kDefaultPadding),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(kItemPadding),
                      child: Icon(
                        Icons.menu,
                        size: kDefaultIconSize,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            margin: EdgeInsets.only(top: 156),
            child: child,
          )
        ],
      ),
    );
  }
}
