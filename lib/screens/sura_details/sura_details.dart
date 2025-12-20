import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/styles.dart';

import '../../models/quran_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String>verses=[];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadSuraFile(model.index);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(model.nameEn, style: AppStyle.bodyStyle),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/Group 1.png", fit: BoxFit.cover),
          Column(
            children: [
              SizedBox(height: 30),
              Text(model.nameAr, style: AppStyle.bodyStyle),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                  return Directionality(textDirection: TextDirection.rtl, child: Text("${verses[index]} ﴿${index+1}﴾",style: AppStyle.bodyStyle,textAlign: TextAlign.center,));

                },),
              ),
              SizedBox(height: 120,)
            ],
          ),
        ],
      ),
    );
  }

  loadSuraFile(int index) async {
    String suraFile = await rootBundle.loadString(
      "assets/files/${index + 1}.txt",
    );
    List<String>lines = suraFile.split("\n");
    verses = lines;
    setState(() {
    });
  }
}



