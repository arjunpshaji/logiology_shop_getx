import 'package:flutter/material.dart';
import 'package:logiology/app/data/model/product_model.dart';
import 'package:logiology/theme/app_theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final void Function()? onTap;
  const ProductTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appColor(context).primary,
          image: DecorationImage(image: AssetImage("assets/icons/paper_bg.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Image.network(product.thumbnail, height: 105),
            Text(product.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis),
            SizedBox(height: 12),
            Text("\$${product.price}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: appColor(context).buttonColor)),
            Text("⭐ ${product.rating}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
