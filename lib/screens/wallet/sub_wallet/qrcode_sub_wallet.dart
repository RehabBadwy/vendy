// import 'package:day_picker/day_picker.dart';
// import 'package:day_picker/model/day_in_week.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/wallet_provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../util/color_manager.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  // final List<DayInWeek> _days =  [
  //   DayInWeek(
  //     "Sun", dayKey: '',
  //   ),
  //   DayInWeek(
  //     "Mon", dayKey: '',
  //   ),
  //   DayInWeek("Tue", isSelected: true, dayKey: ''),
  //   DayInWeek(
  //     "Wed", dayKey: '',
  //   ),
  //   DayInWeek(
  //     "Thu", dayKey: '',
  //   ),
  //   DayInWeek(
  //     "Fri", dayKey: '',
  //   ),
  //   DayInWeek(
  //     "Sat", dayKey: '',
  //   ),
  // ];
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  GlobalKey<FormState> _transfer = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Text("jkkj")
    );
  }
}
