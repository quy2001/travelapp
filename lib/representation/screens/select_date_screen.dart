import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travelapp/core/constants/dismension_constants.dart';
import 'package:travelapp/representation/widgets/app_bar_container.dart';
import 'package:travelapp/representation/widgets/button_widget.dart';

import '../../core/constants/color_constants.dart';

class SelectDateScreen extends StatelessWidget{
  SelectDateScreen({Key? key}) : super(key: key);

  static const routeName ='/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        tittleString: 'Select Date',
        child: Column(
          children: [
            SizedBox(height: kMediumPadding*1.5,),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalette.yellowColor,
              startRangeSelectionColor: ColorPalette.yellowColor,
              endRangeSelectionColor: ColorPalette.yellowColor,
              rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
              todayHighlightColor: ColorPalette.yellowColor,
              toggleDaySelection: true,
              // lấy ngày tháng
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                }else {
                  rangeStartDate = null;
                  rangeEndDate = null;
                }
              },
            ),
            ButtonWidget(
                title: 'Select',
                ontap: (){
                  Navigator.of(context).pop([rangeStartDate,rangeEndDate]);
                }
            ),
            SizedBox(height: kMediumPadding,),
            ButtonWidget(
                title: 'Cancel',
                ontap: (){
                  Navigator.of(context).pop([rangeStartDate,rangeEndDate]);
                }
            ),
          ],
        ),
    );
  }
  
}