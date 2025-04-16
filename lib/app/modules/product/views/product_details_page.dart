import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/data/model/product_model.dart';
import 'package:logiology/app/modules/product/controllers/product_controller.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/common_appbar.dart';

class ProductDetailsPage extends StatelessWidget {
  final controller = Get.put(ProductController());
  ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;
    return Scaffold(
      backgroundColor: appColor(context).background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonAppbar(title: "Product details", arrowColor: appColor(context).primary, isNeedBackArrow: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/icons/paper_bg.jpg"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(product.thumbnail),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: appColor(context).primary,
                image: DecorationImage(image: AssetImage("assets/icons/paper_bg.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(product.title),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.brand),
                      Row(children: [Text("\$${product.price.toString()}"), SizedBox(width: 8), Text("⭐️ ${product.rating.toString()}")]),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text("Description"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
