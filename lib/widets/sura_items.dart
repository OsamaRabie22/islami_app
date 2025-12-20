
import 'package:flutter/material.dart';

import '../core/styles.dart';
import '../models/quran_model.dart';

class SuraItems extends StatelessWidget {
  final SuraModel model;
   SuraItems({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading:Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/img_sur_number_frame.png"),
          Text("${model.index+1}",style: AppStyle.homeStyle,)
        ],
      ),

      title: Text(model.nameEn,style: AppStyle.homeStyle,),
      subtitle: Text("${model.verses} Verses",style: AppStyle.homeStyle,),
      trailing: Text(model.nameAr,style: AppStyle.homeStyle,),
    );
  }
}
