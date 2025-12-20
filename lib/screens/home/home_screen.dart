import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/screens/home/tabs/hadith_tab.dart';
import 'package:islami/screens/home/tabs/quran_tab.dart';
import 'package:islami/screens/home/tabs/radio_tab.dart';
import 'package:islami/screens/home/tabs/sebha_tab.dart';
import 'package:islami/screens/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          getImageIcone(
            imageNAme: "ic_quran.png",
            lable: "Quran",
            index: 0
          ),
          getImageIcone(
              imageNAme: "ic_hadeth.png",
              lable: "Hadith",
              index: 1
          ),
          getImageIcone(
              imageNAme: "ic_sebha.png",
              lable: "Sebha",
              index: 2
          ),
          getImageIcone(
              imageNAme: "ic_radio.png",
              lable: "Radio",
              index: 3
          ),
          getImageIcone(
              imageNAme: "ic_time.png",
              lable: "Time",
              index: 4
          ),

        ],
      ),
      body:SafeArea(
        child: Stack(
        alignment: Alignment.topCenter,

        children: [
          Tabs[selectedIndex],
          Image.asset("assets/images/img_header.png"),
        ],
      ),
      )

    );
  }
List<Widget> Tabs=[
  QuranTab(),
  HadethTab(),
  SebhaTab(),
  RadioTab(),
  TimeTab()
];
  getImageIcone({required String imageNAme,required String lable,required int index}){
    return BottomNavigationBarItem(

      backgroundColor: AppColors.primary,
      icon:selectedIndex==index? Container(
          padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
          decoration: BoxDecoration(
              color: Color.fromRGBO(32, 32, 32, .6),
              borderRadius: BorderRadius.circular(66)
          ),
          child: ImageIcon(AssetImage("assets/images/$imageNAme"))
      ): ImageIcon(AssetImage("assets/images/$imageNAme")),
      label: "$lable",
    );
  }
}
