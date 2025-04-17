import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/data/model/product_model.dart';
import 'package:logiology/app/modules/product/controllers/product_controller.dart';
import 'package:logiology/app/modules/product/views/widgets/discount_circle.dart';
import 'package:logiology/app/modules/product/views/widgets/prodect_details_widget.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/common_appbar.dart';

class ProductDetailsPage extends StatelessWidget {
  final controller = Get.put(ProductController());
  ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColor(context).background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonAppbar(title: "Product details", arrowColor: appColor(context).primary, isNeedBackArrow: true),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/icons/paper_bg.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(product.thumbnail),
                    ),
                    Positioned(
                      right: 0,
                      child: DiscountCircle(discount: product.discountPercentage,),
                    ),
                  ],
                ),
              ),
              ProdectDetailsWidget(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
