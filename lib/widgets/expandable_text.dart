

import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableTExtWidget extends StatefulWidget {

  final String text;


  const ExpandableTExtWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTExtWidget> createState() => _ExpandableTExtWidgetState();
}

class _ExpandableTExtWidgetState extends State<ExpandableTExtWidget> {

  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length> textHeight)
      {
        firstHalf = widget.text.substring(0, textHeight.toInt());
        secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);

      }else
        {
          firstHalf = widget.text;
          secondHalf = "";
        }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: Color(0xff8f837f),size: Dimensions.font16,text: firstHalf) : Column(
        children: [
          SmallText(height: 1.8,color: Color(0xff8f837f),size: Dimensions.font16,text: hiddenText?(firstHalf+"..."): firstHalf+secondHalf),
          InkWell(
            onTap: ()
            {
              setState(() {
                hiddenText =!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more",color: Color(0xff89dad0),),
                Icon(hiddenText?Icons.arrow_drop_down: Icons.arrow_drop_up, color: Color(0xff89dad0),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
