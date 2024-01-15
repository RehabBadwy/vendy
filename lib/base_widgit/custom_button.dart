import 'package:flutter/material.dart';

import '../util/dimensions.dart';


class CustomButton extends StatelessWidget {
  final Function? onTap;
  final String? buttonText;
  final bool isBuy;
  final bool isBorder;
  final Color? backgroundColor;
  final double? radius;
  const CustomButton({Key? key,
    this.onTap, required this.buttonText,
    this.isBuy= false, this.isBorder = false, this.backgroundColor, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap as void Function()?,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:  backgroundColor ?? (isBuy?  Colors.white : Color(0xff1E232C)),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: const Offset(0, 1)), // changes position of shadow
            ],
            border: isBorder ? Border.all(): null,
            borderRadius: BorderRadius.circular(
                radius !=null ? radius! : isBorder? Dimensions.paddingSizeExtraSmall : Dimensions.paddingSizeSmall)),
        child: Text(buttonText!,
            style: TextStyle(
              fontSize: 16,
              color: isBorder ? Color(0xff1E232C): Colors.white,
            )),
      ),
    );
  }
}
