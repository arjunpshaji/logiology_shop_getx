import 'package:flutter/material.dart';
import 'package:logiology/theme/app_theme.dart';

class DiscountCircle extends StatelessWidget {
  final double discount;
  const DiscountCircle({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: appColor(context).buttonColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${discount.toString()}%",
                style: TextStyle(fontSize: 18, color: appColor(context).primary, fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: "\nOFF",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: appColor(context).primaryText, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
