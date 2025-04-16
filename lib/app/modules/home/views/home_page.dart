import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/modules/home/controller/home_controller.dart';
import 'package:logiology/app/modules/home/views/widgets/product_tile.dart';
import 'package:logiology/app/modules/product/views/product_details_page.dart';
import 'package:logiology/app/routes/app_routes.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/common_appbar.dart';
import 'package:logiology/theme/widgets/filter_dialogue.dart';
import 'package:logiology/theme/widgets/loader_widget.dart';
import 'package:logiology/theme/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonAppbar(
          title: "Products",
          arrowColor: appColor(context).primary,
          actionWidget: Row(
            children: [
              IconButton(onPressed: () => openFilterDialog(context), icon: Icon(Icons.filter_list), color: appColor(context).primary),
              IconButton(onPressed: () => Get.toNamed(AppRoutes.profile), icon: Icon(Icons.person), color: appColor(context).primary),
            ],
          ),
        ),
      ),
      body: Obx(
        () =>
            controller.isLoading.value
                ? LoaderWidget()
                : Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
                  child: Column(
                    children: [
                      SearchField(
                        hint: "Search",
                        onChanged: (value) {
                          controller.searchTerm.value = value;
                        },
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: GridView.builder(
                          itemCount: controller.filteredProducts.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (_, i) {
                            final product = controller.filteredProducts[i];
                            return ProductTile(
                              product: product,
                              onTap: () {
                                // Get.to(ProductDetailsPage(), arguments: product);
                                Get.to(() => ProductDetailsPage(), arguments: product);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
