

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/controllers/popular_product_controler.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/screens/food/popular_food_details.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_column.dart';
import 'package:ecommerce/widgets/big_texts.dart';
import 'package:ecommerce/widgets/icons_and_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FoodScreenBody extends StatefulWidget {
  const FoodScreenBody({Key? key}) : super(key: key);

  @override
  State<FoodScreenBody> createState() => _FoodScreenBodyState();
}

class _FoodScreenBodyState extends State<FoodScreenBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor= 0.8;
  double _height =Dimensions.pageViewContainer;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;

      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //Slider Section

        GetBuilder<PopularProductController>(builder: (popularProducts)
          {
            return Container(
              height: Dimensions.pageView,

                child: PageView.builder(
                    controller: pageController,
                    itemCount: 6,
                    itemBuilder: (context, position)
                    {
                      return _buildPageItem(position);
                    }),
            );

          },),

        // Dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: 6,
            position: _currentPageValue.toInt(),
            decorator: DotsDecorator(
              activeColor: Color(0xff89dad0),
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),

          );

        }),


          //Popular Texts
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),

        //List of food and images
        ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index)
          {
            return GestureDetector(
              onTap: ()
              {
                Get.toNamed(RouteHelper.getRecommendedFood());
              },
              child: Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,bottom: Dimensions.height10),
                child: Row(
                  children: [

                    //Image Section
                    Container(
                      width: Dimensions.listViewImageSize,
                      height: Dimensions.listViewImageSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: AssetImage('assets/images/foodimg1.jpg'),

                        )
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Nutrition fro chinese meal" /*"Nutritions fruit meals in china"*/),
                              SizedBox(height: Dimensions.height10,),
                              SmallText(text: "With chinese characteries"),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconsAndText(icon: Icons.circle,
                                      text: "Normal",
                                      iconColor: Color(0xffFFd28d)),
                                  IconsAndText(icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: Color(0xff89dad0)),

                                  IconsAndText(icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: Color(0xfffcab88)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })

      ]

    );
  }
  Widget _buildPageItem(int index) {

    Matrix4 matrix = new Matrix4.identity();
    if(index ==_currentPageValue.floor())
      {
        var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      }
    else if(index == _currentPageValue.floor()+1)
        {
          var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
          var currTrans = _height*(1-currScale)/2;
          matrix = Matrix4.diagonal3Values(1, currScale, 1);
          matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

        }else if(index == _currentPageValue.floor()-1)
        {
          var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
          var currTrans = _height*(1-currScale)/2;
          matrix = Matrix4.diagonal3Values(1, currScale, 1);
          matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

        }
    else
      {
        var currScale = 0.8;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

      }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: ()
            {
              Get.toNamed(RouteHelper.getpopularFood(index));
            },

            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left:Dimensions.width10, right:Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?  Color(0xff69c5df) : Color(0xff9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage('assets/images/foodimg1.jpg')
                ),

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0)
                  )
                ]


              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
                child: AppColumn(text: "Chinese Side",),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
