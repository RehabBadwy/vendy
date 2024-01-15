import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/lang_provider.dart';

class LaunguageScreen extends StatefulWidget {
  const LaunguageScreen({Key? key}) : super(key: key);

  @override
  State<LaunguageScreen> createState() => _LaunguageScreenState();
}

class _LaunguageScreenState extends State<LaunguageScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LangProvider>(context);
    return Column(
      children: [

       InkWell(
           onTap: (){
             provider.changeLang("en");
             Navigator.pop(context);
           },
           child: getLangRow("English", provider.appLang=="en")),
       InkWell(
           onTap: (){
             provider.changeLang("ar");
             Navigator.pop(context);
           },
           child: getLangRow("العربيه", provider.appLang=="ar")),
      ],
    );
  }
  Widget getLangRow(String text,bool isSelected){
    if(isSelected){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
              style: TextStyle(
                  color: Colors.brown
              ),
            ),
            Icon(Icons.check,
                color: Colors.brown
            )
          ],
        ),
      );
    }else{
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
          ],
        ),
      );
    }
  }
}