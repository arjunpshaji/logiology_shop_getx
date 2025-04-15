import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/modules/home/controller/home_controller.dart';
import 'package:logiology/app/modules/home/views/widgets/product_tile.dart';
import 'package:logiology/app/routes/app_routes.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/common_appbar.dart';
import 'package:logiology/theme/widgets/filter_dialogue.dart';

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
        () => Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
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
              return ProductTile(product: product);
            },
          ),
        ),
      ),
    );
  }

  // Filter Dialog
  // void _openFilterDialog(BuildContext context) {
  //   final HomeController controller = Get.find();

  //   // Use TextEditingController with initial values from controller
  //   final minPriceController = TextEditingController(text: controller.activeMinPrice?.toString() ?? '');
  //   final maxPriceController = TextEditingController(text: controller.activeMaxPrice?.toString() ?? '');

  //   final selectedCategory = (controller.activeCategory ?? '').obs;
  //   final selectedTags = controller.activeTags.toList().obs;

  //   Get.defaultDialog(
  //     title: "Filter Products",
  //     content: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           TextField(controller: minPriceController, decoration: InputDecoration(labelText: "Min Price"), keyboardType: TextInputType.number),
  //           TextField(controller: maxPriceController, decoration: InputDecoration(labelText: "Max Price"), keyboardType: TextInputType.number),
  //           SizedBox(height: 10),
  //           Obx(
  //             () => DropdownButton<String>(
  //               hint: Text("Select Category"),
  //               value: selectedCategory.value == '' ? null : selectedCategory.value,
  //               onChanged: (value) => selectedCategory.value = value ?? '',
  //               items:
  //                   controller.categories.map((cat) {
  //                     return DropdownMenuItem(value: cat, child: Text(cat));
  //                   }).toList(),
  //             ),
  //           ),
  //           Wrap(
  //             spacing: 8.0,
  //             children:
  //                 controller.tags.map((tag) {
  //                   return Obx(
  //                     () => FilterChip(
  //                       label: Text(tag),
  //                       selected: selectedTags.contains(tag),
  //                       onSelected: (selected) {
  //                         if (selected) {
  //                           selectedTags.add(tag);
  //                         } else {
  //                           selectedTags.remove(tag);
  //                         }
  //                       },
  //                     ),
  //                   );
  //                 }).toList(),
  //           ),
  //           SizedBox(height: 10),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               ElevatedButton.icon(
  //                 onPressed: () {
  //                   controller.resetFilters();
  //                   Get.back();
  //                 },
  //                 icon: Icon(Icons.refresh),
  //                 label: Text("Reset"),
  //                 style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade400),
  //               ),
  //               ElevatedButton.icon(
  //                 onPressed: () {
  //                   double minPrice = double.tryParse(minPriceController.text) ?? 0;
  //                   double maxPrice = double.tryParse(maxPriceController.text) ?? double.infinity;
  //                   controller.applyAdvancedFilter(
  //                     minPrice: minPrice,
  //                     maxPrice: maxPrice,
  //                     category: selectedCategory.value,
  //                     selectedTags: selectedTags,
  //                   );
  //                   Get.back();
  //                 },
  //                 icon: Icon(Icons.check),
  //                 label: Text("Apply"),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
