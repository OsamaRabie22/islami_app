import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/widets/sura_items.dart';

import '../../../data/quran_data.dart';
import '../../../models/quran_model.dart';
import '../../sura_details/sura_details.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_bg.png"),
          fit: BoxFit.cover,
          opacity: .2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150),
            TextField(
              cursorColor: AppColors.primary,
              style: AppStyle.homeStyle,
              decoration: InputDecoration(
                prefixIcon: Image.asset(
                  "assets/images/ic_quran.png",
                  color: AppColors.primary,
                ),
                hintText: "Sura Name",
                hintStyle: AppStyle.homeStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Most Recently ",style: AppStyle.homeStyle),
            SizedBox(height: 10,),
            Container(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 7,),

                scrollDirection: Axis.horizontal,
                itemCount: suraList.length,
                itemBuilder: (context, index) {
                  final sura = suraList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  
                  height: 150,
                  width: 280,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text( sura.nameEn,style: AppStyle.homeStyle.copyWith(
                              fontSize: 20,
                              color: Color(0xFF202020)
                            ),),
                            Text(sura.nameAr,style: AppStyle.homeStyle.copyWith(
                                fontSize: 20,
                                color: Color(0xFF202020)
                            ),),
                            Text("${sura.verses} Verses",style: AppStyle.homeStyle.copyWith(
                                fontSize: 16,
                                color: Color(0xFF202020)
                            ),),
                          ],
                        ),
                      ),
                      Expanded(child: Image.asset("assets/images/img_most_recent.png"))
                    ],
                  ),
                );
              },

              ),
            ),
            SizedBox(height: 10,),
            Text("Suras List",style: AppStyle.homeStyle),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                padding:EdgeInsets.zero,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.white,
                  indent: 44,
                  endIndent: 44,
                ),
                itemCount: suraList.length,
                itemBuilder: (context, index) =>InkWell(

                  onTap: (){
                    Navigator.of(context).pushNamed(SuraDetails.routeName,
                      arguments: suraList[index],
                    );
                  },
                  child: SuraItems(
                    model: suraList[index],
                  ),

                )

              ),
            )
          ],
        ),
      ),
    );
  }
}
