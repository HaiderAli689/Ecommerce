
import 'package:ecommerce/widgets/big_texts.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({Key? key}) : super(key: key);

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Pakistan",
                        color: Color(0xff89dad0)),

                    Row(
                      children: [
                        SmallText(text: "Faisalabad",color: Colors.black54,),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),

                  ],
                ),
                Center(
                  child: Container(
                    height: Dimensions.height45,
                    width: Dimensions.width45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: Color(0xff89dad0)
                    ),
                    child: Icon(Icons.search, color: Colors.white,size: Dimensions.icon24,),
                  ),
                ),
              ],
            ),
        ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: FoodScreenBody()),),
    ],
      ),
    );
  }
}
