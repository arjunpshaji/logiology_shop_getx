import 'package:flutter/material.dart';
import 'package:logiology/app/data/model/product_model.dart';
import 'package:logiology/app/modules/product/views/widgets/review_tile.dart';
import 'package:logiology/theme/app_theme.dart';

class ProdectDetailsWidget extends StatelessWidget {
  final ProductModel product;
  const ProdectDetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appColor(context).whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.brand, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              Row(
                children: [
                  Text(
                    "\$${product.price.toString()}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: appColor(context).buttonColor),
                  ),
                  SizedBox(width: 8),
                  Text("⭐️ ${product.rating.toString()}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          SizedBox(height: 8),
          Text(product.description, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
          SizedBox(height: 12),
          Text("Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          SizedBox(height: 8),
          ReviewTile(reviews: product.reviews),
          SizedBox(height: 8),
          Text("Special information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text(product.warrantyInformation, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          Text(product.returnPolicy, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
