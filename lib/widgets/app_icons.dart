
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class AppIcons extends StatelessWidget {

  final IconData icon;
  final Color backgroundcolor;
  final Color iconcolor;
  final double size;
  final double iconSize;

  const AppIcons({Key? key,
    required this.icon,
    this.backgroundcolor = const Color(0xFFfcf4e4),
    this.iconcolor = const Color(0xFF756d54),
    this.iconSize = 16,
    this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundcolor,

      ),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconSize,
      ),
    );
  }
}
