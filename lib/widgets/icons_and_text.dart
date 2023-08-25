

import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class IconsAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;


  const IconsAndText({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: Dimensions.icon24,
          color: iconColor,),
        SizedBox(width: 5,),
        SmallText(text: text, )

      ],
    );
  }
}
